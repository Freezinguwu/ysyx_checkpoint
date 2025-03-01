
module  ALU(
    input[3:0]     dA,
    input[3:0]     dB,
    input[3:0]     operator_sel,
    output         carry,
    output[3:0]    result,
    output         zero
);
    reg[7:0] operate;

//operator | add | sub | not | and  | or | xor | ilt | iet
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
        endcase
    end

endmodule

module inv(
    input[3:0]  din,
    output[3:0] din_inv
);
    assign din_inv = ~din + 32'd1;
endmodule