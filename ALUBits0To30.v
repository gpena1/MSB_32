// Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus II License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 15.0.0 Build 145 04/22/2015 SJ Web Edition"
// CREATED		"Tue Feb  2 07:23:05 2021"

module ALUBits0To30(
	a,
	b,
	less,
	Ainvert,
	Binvert,
	CarryIn,
	Operation,
	Result,
	CarryOut
);


input wire	a;
input wire	b;
input wire	less;
input wire	Ainvert;
input wire	Binvert;
input wire	CarryIn;
input wire	[1:0] Operation;
output wire	Result;
output wire	CarryOut;

wire	A_afterMUX;
wire	AandB;
wire	AorB;
wire	B_afterMUX;
wire	NOTa;
wire	NOTb;
wire	S;





MUX4	b2v_finalMUX(
	.A(AandB),
	.B(AorB),
	.C(S),
	.D(less),
	.S(Operation),
	.Y(Result));

assign	NOTa =  ~a;

assign	NOTb =  ~b;

assign	AandB = A_afterMUX & B_afterMUX;

assign	AorB = B_afterMUX | A_afterMUX;


MUX2	b2v_muxA(
	.S(Ainvert),
	.A(a),
	.B(NOTa),
	.Y(A_afterMUX));


MUX2	b2v_muxB(
	.S(Binvert),
	.A(b),
	.B(NOTb),
	.Y(B_afterMUX));


OneBitAdder	b2v_myAdder(
	.ci(CarryIn),
	.a(A_afterMUX),
	.b(B_afterMUX),
	.co(CarryOut),
	.s(S));


endmodule
