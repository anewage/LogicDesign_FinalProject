module MainModule(enter, number, total, clear, inputNums, errOut, outNumbers, clk);
    input enter, number, total, clear, clk;
    input [9:0] inputNums;
    output [34:0] outNumbers;
	 output errOut;
    wire [19:0] BCDnums;
    wire [16:0] outBinResult;
    wire [13:0] outputBinNum;
    wire update, show, store, reset, err, enterOut, numberOut, totalOut, clearOut;
    
    Controller cntrlr(enter, number, total, clear, enterOut, numberOut, totalOut, clearOut, err);
    InputModule im(enterOut, clearOut, inputNums, outputBinNum, clk);
    ComputeModule cm(enterOut, numberOut, totalOut, clearOut, update, show, store, reset, clk);
    ExecutionModule em(outputBinNum , show, reset, store, update, outBinResult, err, errOut, clk);
    BinaryToBCD bin2BCD(outBinResult, BCDnums, clk);
    BCDto7Seg firstDigit(BCDnums[3:0], outNumbers[6:0], errOut, clk);
    BCDto7Seg secondDigit(BCDnums[7:4], outNumbers[13:7], errOut, clk);
    BCDto7Seg thirdDigit(BCDnums[11:8], outNumbers[20:14], errOut, clk);
    BCDto7Seg fourthDigit(BCDnums[15:12], outNumbers[27:21], errOut, clk);
    BCDto7Seg fifthDigit(BCDnums[19:16], outNumbers[34:28], errOut, clk);
    
endmodule
