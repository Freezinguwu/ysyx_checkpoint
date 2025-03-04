`define DATA_LEN 4 
//ALU
module ALU(
    input[`DATA_LEN-1:0]        Ai,
    input[`DATA_LEN-1:0]        Bi,
    input[3:0]                  operator_sel,
    output                      overflow,
    output reg[`DATA_LEN-1:0]   result,
    output                      zero
);
    reg[7:0] operate; //command
    reg[`DATA_LEN-1:0] dA;
    reg[`DATA_LEN-1:0] dB;
    //sign/unsigned num
    inv inv_a(.din(Ai),.din_inv(dA));
    inv inv_b(.din(Bi),.din_inv(dB));
    
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
        
        // judge 
        if(operate == 8'b11111111)
        result <= 8;
        else begin
        
        result <= operate[7] == 1  ? dA + dB : 0; //add
        result <= operate[6] == 1  ? Ai + dB : 1; //sub
        result <= operate[5] == 1  ? ~dA     : 2; //not
        result <= operate[4] == 1  ? dA & dB : 3; //and
        result <= operate[3] == 1  ? dA | dB : 4; //or
        result <= operate[2] == 1  ? dA ^ dB : 5; //xor   
        end
    end

    assign overflow = ~((dA[`DATA_LEN-1] & dB[`DATA_LEN-1]) & (result[`DATA_LEN-1] & dA[`DATA_LEN-1])) ^ ~result[`DATA_LEN-1];
    assign zero = (result == 4'b0000);
endmodule


