module testbench1;
    reg enter, number, total, clear, clk;
    reg [9:0] inputNums;
    wire [34:0] outNumbers;
    wire errOut;
    
    MainModule m(enter, number, total, clear, inputNums, errOut, outNumbers, clk);
    
	initial
    begin
        clk = 1'b0;
        repeat (500)
           #5 clk = ~clk;
    end
    
  initial
  begin
	enter = 1'b0; number = 1'b0; total = 1'b0; clear = 1'b0;
    inputNums = 0;
	#10 inputNums[5] = 1'b1;
	#10 inputNums[5] = 1'b0;
	#10 inputNums[0] = 1'b1;
	#10 inputNums[0] = 1'b0;
	#10 inputNums[0] = 1'b1;
	#10 inputNums[0] = 1'b0;
	#10 enter = 1'b1;
	#10 enter = 1'b0;
	#10 total = 1'b1;
	#10 total = 1'b0;
	#10 inputNums[2] = 1'b1;
	#10 inputNums[2] = 1'b0;
	#10 inputNums[4] = 1'b1;
	#10 inputNums[4] = 1'b0;
	#10 inputNums[0] = 1'b1;
	#10 inputNums[0] = 1'b0;
	#10 inputNums[0] = 1'b1;
	#10 inputNums[0] = 1'b0;
	#10 enter = 1'b1;
	#10 enter = 1'b0;
	#10 number = 1'b1;
	#10 number = 1'b0;
	#10 inputNums[2] = 1'b1;
	#10 inputNums[2] = 1'b0;
	#10 inputNums[6] = 1'b1;
	#10 inputNums[6] = 1'b0;
	#10 enter = 1'b1;
	#10 enter = 1'b0;
	#10 total = 1'b1;
	#10 total = 1'b0;
  end
	
endmodule



module testbench2;
    reg enter, number, total, clear, clk;
    reg [9:0] inputNums;
    wire [34:0] outNumbers;
    wire errOut;
    
    MainModule m(enter, number, total, clear, inputNums, errOut, outNumbers, clk);
    
	initial
    begin
        clk = 1'b0;
        repeat (500)
           #5 clk = ~clk;
    end
    
  initial
  begin
	enter = 1'b0; number = 1'b0; total = 1'b0; clear = 1'b0;
    inputNums = 0;
	#10 inputNums[1] = 1'b1;
	#10 inputNums[1] = 1'b0;
	#10 inputNums[8] = 1'b1;
	#10 inputNums[8] = 1'b0;
	#10 inputNums[0] = 1'b1;
	#10 inputNums[0] = 1'b0;
	#10 inputNums[0] = 1'b1;
	#10 inputNums[0] = 1'b0;
	#10 enter = 1'b1;
	#10 enter = 1'b0;
	#10 inputNums[9] = 1'b1;
	#10 inputNums[9] = 1'b0;
	#10 inputNums[9] = 1'b1;
	#10 inputNums[9] = 1'b0;
	#10 inputNums[0] = 1'b1;
	#10 inputNums[0] = 1'b0;
	#10 inputNums[0] = 1'b1;
	#10 inputNums[0] = 1'b0;
	#10 enter = 1'b1;
	#10 enter = 1'b0;
	#10 number = 1'b1;
	#10 number = 1'b0;
	#10 inputNums[8] = 1'b1;
	#10 inputNums[8] = 1'b0;
	#10 inputNums[0] = 1'b1;
	#10 inputNums[0] = 1'b0;
	#10 enter = 1'b1;
	#10 enter = 1'b0;
	#10 total = 1'b1;
	#10 total = 1'b0;
  end
	
endmodule


module testbench3;
    reg enter, number, total, clear, clk;
    reg [9:0] inputNums;
    wire [34:0] outNumbers;
    wire errOut;
    
    MainModule m(enter, number, total, clear, inputNums, errOut, outNumbers, clk);
    
	initial
    begin
        clk = 1'b0;
        repeat (500)
           #5 clk = ~clk;
    end
    
  initial
  begin
	enter = 1'b0; number = 1'b0; total = 1'b0; clear = 1'b0;
    inputNums = 0;
	#10 inputNums[1] = 1'b1;
	#10 inputNums[1] = 1'b0;
	#10 inputNums[8] = 1'b1;
	#10 inputNums[8] = 1'b0;
	#10 inputNums[0] = 1'b1;
	#10 inputNums[0] = 1'b0;
	#10 inputNums[0] = 1'b1;
	#10 inputNums[0] = 1'b0;
	#10 enter = 1'b1; clear = 1'b1;
	#10 enter = 1'b0; clear = 1'b0;
	#10 total = 1'b1;
	#10 total = 1'b0;
	#10 inputNums[1] = 1'b1;
	#10 inputNums[1] = 1'b0;
	#10 inputNums[8] = 1'b1;
	#10 inputNums[8] = 1'b0;
	#10 inputNums[0] = 1'b1;
	#10 inputNums[0] = 1'b0;
	#10 inputNums[0] = 1'b1;
	#10 inputNums[0] = 1'b0;
	#10 enter = 1'b1;
	#10 enter = 1'b0;
	#10 total = 1'b1;
	#10 total = 1'b0;
  end
	
endmodule


module MainModule(enter, number, total, clear, inputNums, errOut, outNumbers, clk);
    input enter, number, total, clear, clk;
    input [9:0] inputNums;
    output [55:0] outNumbers;
	output errOut;
    wire [19:0] BCDnums;
    wire [16:0] outBinResult;
    wire [13:0] outputBinNum;
    wire update, show, store, reset, err, enterOut, numberOut, totalOut, clearOut;
    
    Controller cntrlr(enter, number, total, clear, enterOut, numberOut, totalOut, clearOut, err, clk);
    InputModule im(enterOut, clearOut, inputNums, outputBinNum, clk);
    ComputeModule cm(enterOut, numberOut, totalOut, clearOut, update, show, store, reset, clk);
    ExecutionModule em(outputBinNum , show, reset, store, update, outBinResult, err, errOut, clk);
    BinaryToBCD bin2BCD(outBinResult, BCDnums, clk);
    BCDto7Seg firstDigit(BCDnums[3:0], outNumbers[6:0], errOut, clk);
    BCDto7Seg secondDigit(BCDnums[7:4], outNumbers[13:7], errOut, clk);
    BCDto7Seg thirdDigit(BCDnums[11:8], outNumbers[20:14], errOut, clk);
    BCDto7Seg fourthDigit(BCDnums[15:12], outNumbers[27:21], errOut, clk);
    BCDto7Seg fifthDigit(BCDnums[19:16], outNumbers[34:28], errOut, clk);
	BCDto7Seg sixthDigit(0, outNumbers[41:35], errOut, clk);
    BCDto7Seg seventhDigit(0, outNumbers[48:42], errOut, clk);
	BCDto7Seg eighththDigit(0, outNumbers[55:49], errOut, clk);
	 
	initial
    begin
        $monitor("enter:%b, number:%b, total:%b, clear:%b, inputNums:%b, 1st:%b, 2nd:%b, 3rd: %b, 4th:%b, 5th:%b, ERROR: %b, Result: %d", enter, number, total, clear, inputNums, outNumbers[6:0], outNumbers[13:7], outNumbers[20:14], outNumbers[27:21], outNumbers[34:28],errOut, outBinResult);
    end
endmodule
