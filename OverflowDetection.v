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
// CREATED		"Tue Feb  2 07:24:31 2021"

module OverflowDetection(
	Op1,
	A,
	B,
	Result,
	Overflow
);


input wire	Op1;
input wire	A;
input wire	B;
input wire	Result;
output wire	Overflow;

wire	notA;
wire	notB;
wire	notResult;
wire	signsDontMatch;
wire	twoNegResultPos;
wire	twoPosResNeg;




assign	twoNegResultPos = notA & notB & Result;

assign	twoPosResNeg = A & B & notResult;

assign	signsDontMatch = twoPosResNeg | twoNegResultPos;

assign	notA =  ~A;

assign	notB =  ~B;

assign	notResult =  ~Result;

assign	Overflow = Op1 & signsDontMatch;


endmodule
