module char_detector (
    input [7:0] char,
    output reg is_true1
);
    always @(*) begin
        // Check for emergency vehicle codes (a=0x61, b=0x62, c=0x63)
        // These represent: a=ambulance, b=fire, c=police
        if (char == 8'h61 || char == 8'h62 || char == 8'h63)
            is_true1 = 1'b1;
        else
            is_true1 = 1'b0;
    end
endmodule
