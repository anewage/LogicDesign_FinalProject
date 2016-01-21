// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

module mainFPGA
(
// {ALTERA_ARGS_BEGIN} DO NOT REMOVE THIS LINE!

	clear,
	clk,
	enter,
	errOut,
	inputNums,
	number,
	outNumbers,
	total
// {ALTERA_ARGS_END} DO NOT REMOVE THIS LINE!

);

// {ALTERA_IO_BEGIN} DO NOT REMOVE THIS LINE!
input			clear;
input			clk;
input			enter;
output			errOut;
input	[9:0]	inputNums;
input			number;
output	[55:0]	outNumbers;
input			total;

// {ALTERA_IO_END} DO NOT REMOVE THIS LINE!
// {ALTERA_MODULE_BEGIN} DO NOT REMOVE THIS LINE!
MainModule m(enter, number, total, clear, inputNums, errOut, outNumbers, clk);
// {ALTERA_MODULE_END} DO NOT REMOVE THIS LINE!
endmodule
