module testbench();

reg[31:0] A;
reg[31:0] B;
reg[4:0] alu_op;
wire[31:0] S;

ALU32 myALU(A, alu_op, B, S);

initial begin
A=45; alu_op=5'b00000; B=21;   #10; // AND 
if (S !== (A&B)) begin
           $display("Error computing %d&%d: Should be %d but got %d", A, B, A&B, S); $stop;
end
alu_op=5'b00001;   #10;  // OR
if (S !== (A|B)) begin
           $display("Error computing %d|%d: Should be %d but got %d", A, B, A|B, S); $stop;
end
alu_op=5'b00010;    #10;  // ADD
if (S !== (A+B)) begin
           $display("Error computing %d+%d: Should be %d but got %d", A, B, A+B, S); $stop;
end
alu_op=5'b01110; #10; // SUB 
if (S !== (A-B)) begin
           $display("Error computing %d-%d: Should be %d but got %d", A, B, A-B, S); $stop;
end
alu_op=5'b01111; #10; // SLT
if (S !== (A<B)) begin
           $display("Error computing %d<%d: Should be %d but got %d", A, B, A<B, S); $stop;
end
A=21; B=45; alu_op=5'b01111; #10; // SLT, other way around
if (S !== (A<B)) begin
           $display("Error computing %d<%d: Should be %d but got %d", A, B, A<B, S); $stop;
end
A=21; B=45; alu_op=5'b11000; #10; // NOR
if (S !== (~(A|B))) begin
           $display("Error computing %d NOR %d: Should be %d but got %d", A, B, ~(A|B), S); $stop;
end
A=21; B=45; alu_op=5'b11001; #10; // NAND
if (S !== (~(A&B))) begin
           $display("Error computing %d NAND %d: Should be %d but got %d", A, B, ~(A&B), S); $stop;
end

$display("All tests passed.");
end

endmodule