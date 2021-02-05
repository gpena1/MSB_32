// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
// CREATED		"Fri Feb 05 05:36:56 2021"

module ALUBit31(
	a,
	b,
	less,
	Ainvert,
	Binvert,
	CarryIn,
	Operation,
	Result,
	Set,
	Overflow
);


input wire	a;
input wire	b;
input wire	less;
input wire	Ainvert;
input wire	Binvert;
input wire	CarryIn;
input wire	[1:0] Operation;
output wire	Result;
output wire	Set;
output wire	Overflow;

wire	A_afterMUX;
wire	AandB;
wire	AorB;
wire	B_afterMUX;
wire	notA;
wire	notB;
wire	S;
wire	toGround;





MUX4	b2v_finalMUX(
	.A(AandB),
	.B(AorB),
	.C(S),
	.D(less),
	.S(Operation),
	.Y(Result));


Grounder	b2v_inst(
	.Input_To_Ground(toGround));

assign	notA =  ~a;

assign	notB =  ~b;

assign	AandB = A_afterMUX & B_afterMUX;

assign	AorB = B_afterMUX | A_afterMUX;


MUX2	b2v_muxA(
	.S(Ainvert),
	.A(a),
	.B(notA),
	.Y(A_afterMUX));


MUX2	b2v_muxB(
	.S(Binvert),
	.A(b),
	.B(notB),
	.Y(B_afterMUX));


OneBitAdder	b2v_myAdder(
	.ci(CarryIn),
	.a(A_afterMUX),
	.b(B_afterMUX),
	.co(toGround),
	.s(S));


OverflowDetection	b2v_OV(
	.Op1(Operation[1]),
	.A(A_afterMUX),
	.B(B_afterMUX),
	.Result(S),
	.Overflow(Overflow));

assign	Set = S;

endmodule
