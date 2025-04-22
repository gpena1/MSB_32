// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
// CREATED		"Tue Aug 15 11:08:00 2023"

module Encoder_32(
	A0,
	A1,
	A2,
	A3,
	A4,
	A5,
	A6,
	A7,
	A8,
	A9,
	A10,
	A11,
	A12,
	A13,
	A14,
	A15,
	A16,
	A17,
	A18,
	A19,
	A20,
	A21,
	A22,
	A23,
	A24,
	A25,
	A26,
	A27,
	A28,
	A29,
	A30,
	A31,
	Q
);


input wire	A0;
input wire	A1;
input wire	A2;
input wire	A3;
input wire	A4;
input wire	A5;
input wire	A6;
input wire	A7;
input wire	A8;
input wire	A9;
input wire	A10;
input wire	A11;
input wire	A12;
input wire	A13;
input wire	A14;
input wire	A15;
input wire	A16;
input wire	A17;
input wire	A18;
input wire	A19;
input wire	A20;
input wire	A21;
input wire	A22;
input wire	A23;
input wire	A24;
input wire	A25;
input wire	A26;
input wire	A27;
input wire	A28;
input wire	A29;
input wire	A30;
input wire	A31;
output wire	[4:0] Q;

wire	[4:0] Q_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;




assign	SYNTHESIZED_WIRE_1 = A5 | A3 | A1 | A11 | A9 | A7 | A15 | A13 | A17 | A21 | A19 | A23;

assign	SYNTHESIZED_WIRE_0 = A25 | A29 | A31 | A27;

assign	Q_ALTERA_SYNTHESIZED[0] = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_3 = A6 | A3 | A2 | A11 | A10 | A7 | A15 | A14 | A18 | A22 | A19 | A23;

assign	SYNTHESIZED_WIRE_2 = A26 | A30 | A31 | A27;

assign	SYNTHESIZED_WIRE_5 = A6 | A5 | A4 | A13 | A12 | A7 | A15 | A14 | A20 | A22 | A21 | A23;

assign	Q_ALTERA_SYNTHESIZED[1] = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_4 = A28 | A30 | A31 | A29;

assign	Q_ALTERA_SYNTHESIZED[2] = SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_7 = A10 | A9 | A8 | A13 | A12 | A11 | A15 | A14 | A24 | A26 | A25 | A27;

assign	SYNTHESIZED_WIRE_6 = A28 | A30 | A31 | A29;

assign	Q_ALTERA_SYNTHESIZED[3] = SYNTHESIZED_WIRE_6 | SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_9 = A18 | A17 | A16 | A21 | A20 | A19 | A23 | A22 | A24 | A26 | A25 | A27;

assign	SYNTHESIZED_WIRE_8 = A28 | A30 | A31 | A29;

assign	Q_ALTERA_SYNTHESIZED[4] = SYNTHESIZED_WIRE_8 | SYNTHESIZED_WIRE_9;

assign	Q = Q_ALTERA_SYNTHESIZED;

endmodule
