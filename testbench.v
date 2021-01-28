module testbench();

reg[31:0] A;
reg[31:0] B;
reg[4:0] alu_op;
wire[31:0] S;
wire eq;
wire overflow;

ALU32 myALU(A, alu_op, B, eq, overflow, S);

initial begin
A=45; alu_op=5'b00000; B=21;   #10; // AND 
if (S !== (A&B)) begin
           $display("Error computing %d&%d: Should be %d but got %d", A, B, A&B, S); $stop;
end
if (overflow) begin
	   $display("Expected no overflow, but got overflow"); $stop;
end
alu_op=5'b00001;   #10;  // OR
if (S !== (A|B)) begin
           $display("Error computing %d|%d: Should be %d but got %d", A, B, A|B, S); $stop;
end
if (overflow) begin
	   $display("Expected no overflow, but got overflow"); $stop;
end
alu_op=5'b00010;    #10;  // ADD
if (S !== (A+B)) begin
           $display("Error computing %d+%d: Should be %d but got %d", A, B, A+B, S); $stop;
end
if (overflow) begin
	   $display("Expected no overflow, but got overflow"); $stop;
end
alu_op=5'b01110; #10; // SUB 
if (S !== (A-B)) begin
           $display("Error computing %d-%d: Should be %d but got %d", A, B, A-B, S); $stop;
end
if (overflow) begin
	   $display("Expected no overflow, but got overflow"); $stop;
end
if (eq !== 0) begin
   $display("Unequal operands did not yield eq of 0.  Value: $d", eq);
end
if (overflow) begin
	   $display("Expected no overflow, but got overflow"); $stop;
end
alu_op=5'b01111; #10; // SLT
if (S !== (A<B)) begin
           $display("Error computing %d<%d: Should be %d but got %d", A, B, A<B, S); $stop;
end
if (overflow) begin
	   $display("Expected no overflow, but got overflow"); $stop;
end
A=21; B=45; alu_op=5'b01111; #10; // SLT, other way around
if (S !== (A<B)) begin
           $display("Error computing %d<%d: Should be %d but got %d", A, B, A<B, S); $stop;
end
if (overflow) begin
	   $display("Expected no overflow, but got overflow"); $stop;
end
A=21; B=45; alu_op=5'b11000; #10; // NOR
if (S !== (~(A|B))) begin
           $display("Error computing %d NOR %d: Should be %d but got %d", A, B, ~(A|B), S); $stop;
end
if (overflow) begin
	   $display("Expected no overflow, but got overflow"); $stop;
end
A=21; B=45; alu_op=5'b11001; #10; // NAND
if (S !== (~(A&B))) begin
           $display("Error computing %d NAND %d: Should be %d but got %d", A, B, ~(A&B), S); $stop;
end
if (overflow) begin
	   $display("Expected no overflow, but got overflow"); $stop;
end
A=45; B=45; alu_op=5'b01110; #10; // EQUALITY CHECK
if (eq !== 1) begin
   $display("Equal operands did not yield eq of 1.  Value: $d", eq);
end
if (overflow) begin
	   $display("Expected no overflow, but got overflow"); $stop;
end
/////////////////////////////////////////////////////////////////////////////
A = 2147483647; B = 1;
alu_op=5'b00010;    #10;  // ADD
if (overflow !== 1) begin
	   $display("Expected overflow on test1, but got no overflow"); $stop;
end

A = -2147483648; B = -1;
alu_op=5'b00010;    #10;  // add
if (overflow !== 1) begin
	   $display("Expected overflow on test2, but got no overflow"); $stop;
end

A = -2147483648; B = 1;
alu_op=5'b01110; #10; //sub
if (overflow !== 1) begin
	   $display("Expected overflow on test3, but got no overflow"); $stop;
end
A = 2147483647; B = -1;
alu_op=5'b01110; #10; //sub
if (overflow !== 1) begin
	   $display("Expected overflow on test4, but got no overflow"); $stop;
end
A = 2147483647; B = -1;
alu_op=5'b01111; #10; // SLT
if (overflow !== 1) begin
	   $display("Expected overflow on test5, but got no overflow"); $stop;
end
A = -2147483648; B = 1;
alu_op=5'b01111; #10; // SLT
if (overflow !== 1) begin
	   $display("Expected overflow on test6, but got no overflow"); $stop;
end
/////////////////////////////////////////////////////////////////////////////
$display("All tests passed.");
end

endmodule