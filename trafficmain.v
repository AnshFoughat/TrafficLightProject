//// create a traffic light control main highway and a country side 
//// condition 1 it should be zero state in main highway 
//// condition 2 a traffic detication on country side if it is positive wait for 3minutes and if it found ambulance and firegriates then close main highway
//// immediately if time is greater then 9:pm then close country side permanently expect for ambulance and firegriates and police till 5:00am
//// country side road open timing is 3mintue onl not more than 
//// yellow to red is 7second
//// ////////////////////////traffic lights
`define Red 2'b00
`define Green 2'b11
`define Yellow 2'b01

`define s0  3'b000
`define s1  3'b001
`define s2  3'b010
`define s3  3'b011
`define s4  3'b100
`define s5  3'b101

`define YellowtoRed  250000000
`define RedtoGreen   250000000
`define s0tos1       50000000
`define s1tos2       150000000
`define s3tos4       350000000

`define TRUE 1'b1
`define FALSE 1'b0

module first1(
    output reg [1:0] hwy, country,
    input X, B, clock, clear,is_true,
    input [4:0] hours,
    input [5:0] minutes,
    input [7:0] char,
    input wire is_true1
);
reg [2:0] state;
reg [2:0] next_state;

initial begin
    state = `s0;
    next_state = `s0;
    hwy = `Green;
    country = `Red;
end

always @(posedge clock or posedge clear) begin
    if (clear)
        state <= `s0;
    else
        state <= next_state;
end

always @(*) begin
    case(state)
        `s0: begin
            hwy = `Green;
            country = `Red;
        end
        `s1: begin
            hwy = `Green;
            country = `Red;
        end
        `s2: begin
            hwy = `Yellow;
            country = `Red;
         end
        `s3: begin
            hwy = `Red;
            country = `Green;
        end
        `s4: begin
            hwy = `Red;
            country = `Yellow;
        end
        default: begin
            hwy = `Red;
            country = `Red;
        end
    endcase
end

reg [28:0] counter;
reg delay_complete;
reg [28:0] next_counter;

always @(posedge clock or posedge clear) begin
    if (clear) begin
        counter <= 29'd0;
        delay_complete <= 1'b0;
    end else if (next_counter != 29'd0) begin
        counter <= next_counter;
        delay_complete <= 1'b0;
    end else if (counter != 0) begin
        counter <= counter - 1;
        delay_complete <= (counter == 1);
    end else begin
        delay_complete <= 1'b1;
    end
end

always @(posedge clock) begin
    next_state = state;
    next_counter = 29'd0;
    if ((X && is_true1) || (X && is_true) ) begin
        case (state)
            `s0: if (X && counter == 0) begin
                    next_counter = `s0tos1;
                    if (is_true1)
                        next_state = `s2;
                    else if (delay_complete)
                        next_state = `s1;
                    else
                        next_state = `s0;
                 end
            `s1: if (counter == 0) begin
                    next_counter = `s1tos2;
                    if (delay_complete)
                        next_state = `s2;
                 end
            `s2: if (counter == 0) begin
                    next_counter = `YellowtoRed;
                    if (delay_complete)
                        next_state = `s3;
                 end
            `s3: if (counter == 0) begin
                    next_counter = `s3tos4;
                    if (delay_complete)
                        next_state = `s4;
                 end
            `s4: if (counter == 0) begin
                    next_counter = `YellowtoRed;
                    if (delay_complete)
                        next_state = `s0;
                 end
            default: next_state = `s0;
        endcase
    end else begin
        next_state = state;
        case (state)
            `s0: if (is_true1)
                    next_state = `s2;
                 else
                    next_state = `s0;
            `s2: if (counter == 0) begin
                    next_counter = `YellowtoRed;
                    if (delay_complete)
                        next_state = `s4;
                 end
            `s4: if (counter == 0) begin
                    next_counter = `YellowtoRed;
                    if (delay_complete)
                        next_state = `s0;
                 end
            default: next_state = `s0;
        endcase
    end
    
end

endmodule   
