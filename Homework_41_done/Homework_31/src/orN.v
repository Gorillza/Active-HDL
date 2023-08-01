module orN #(parameter N = 4) (
    input logic [N - 1 : 0] x,
    output logic y
);
    assign y = |x;
endmodule