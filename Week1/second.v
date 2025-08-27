module circuit2(Z, A2, B2, C2);
    input A2, B2, C2;
    output Z;
    assign Z = (A2 | (C2 & B2)) | (B2 & A2);
endmodule
