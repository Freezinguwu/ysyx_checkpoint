
module  ALU(
    input[3:0]     dA,
    input[3:0]     dB,
    input[3:0]     operator_sel,
    output         carry,
    output         overflow,
    output reg[3:0]    result,
    output         zero
);
    reg[7:0] operate;
    reg overflow_in;
    reg[3:0] Ai;
    reg[3:0] Bi;

    //operator | add | sub | not | and | or | xor | ilt | iet
    always @(operator_sel) begin
        case(operator_sel)
        4'b0000: operate <= 8'b10000000;
        4'b0001: operate <= 8'b01000000; 
        4'b0010: operate <= 8'b00100000;
        4'b0011: operate <= 8'b00010000;
        4'b0100: operate <= 8'b00001000;
        4'b0101: operate <= 8'b00000100;
        4'b0110: operate <= 8'b00000010;
        4'b0111: operate <= 8'b00000001;
        default: operate <= 8'b11111111;
        endcase
        
        //sign/unsigned num
        inv();
        inv();
        
        // judge 
        if(operate == 8'b11111111)
            result = 8;
        else begin
        result <= operate[7] == 1 ? dA + dB : 7;
        result <= operate[6] == 1 ? dA + dB : 6;
        result <= operate[5] == 1 ? dA + dB : 5;
        result <= operate[4] == 1 ? dA + dB : 4;
        result <= operate[3] == 1 ? dA + dB : 3;
        result <= operate[2] == 1 ? dA + dB : 2;
        result <= operate[1] == 1 ? dA + dB : 1;
        result <= operate[0] == 1 ? dA + dB : 0;
        end
    end

endmodule

module inv(
    input[3:0]  din,
    output[3:0] din_inv
);
    assign din_inv = ~din + 32'd1;
endmodule