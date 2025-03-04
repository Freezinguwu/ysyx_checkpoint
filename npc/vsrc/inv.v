`define DATA_LEN 4 
module inv(
    input[`DATA_LEN-1:0]  din,
    output[`DATA_LEN-1:0] din_inv
);
    assign din_inv = ~din + 4'b0001;
endmodule
