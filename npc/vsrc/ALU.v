`define DATA_LEN 4 
//ALU
module ALU(
    input[`DATA_LEN-1:0]        Ai,
    input[`DATA_LEN-1:0]        Bi,
    input[3:0]                  operator_sel,
    output                      overflow,
    output reg[`DATA_LEN-1:0]   result,
    output                      zero,
    output reg                  carry
);
    reg[`DATA_LEN-1:0] dA;
    reg[`DATA_LEN-1:0] dB;
    //sign/unsigned num
    always @(Ai or Bi)
    begin
        dA = ~Ai + 4'b0001;
        dB = ~Bi + 4'b0001;
    end
    
    //operator | add | sub | not | and | or | xor | ilt | iet
    always @(operator_sel) begin    

        case(operator_sel)
        4'b0000: {carry, result} <= Ai + Bi;
        4'b0001: result <= Ai + dB; 
        4'b0010: result <= ~dA;
        4'b0011: result <= dA & dB;
        4'b0100: result <= dA | dB;
        4'b0101: result <= dA ^ dB;
        4'b0110: result <= (dA > dB ? 4'b1001: 4'b0000) ;
        4'b0111: result <= (dA == dB ? 4'b0011 : 4'b0000);
        default: result <= 4'b0000;
        endcase
        
    end

    assign overflow = ((Ai[`DATA_LEN-1] == dB[`DATA_LEN-1]) & (result[`DATA_LEN-1] != dB[`DATA_LEN-1]));
    assign zero = (result == 4'b0000);
endmodule


