module mainTestBench;
    reg enter, number, total, clear;
    reg [9:0] inputNums;
    wire [34:0] outNumbers;
    wire [19:0] BCDnums;
    wire [16:0] outBinResult;
    wire [13:0] outputBinNum;
    wire update, show, store, reset, err, errOut, enterOut, numberOut, totalOut, clearOut, valid;
    
    Controller cntrlr(enter, number, total, clear, enterOut, numberOut, totalOut, clearOut, err);
    InputModule im(enterOut, clearOut, inputNums, valid, outputBinNum);
    ComputeModule cm(enterOut, numberOut, totalOut, clearOut, update, show, store, reset, valid);
    ExecutionModule em(outputBinNum , show, reset, store, update, outBinResult, err, errOut);
    BinaryToBCD bin2BCD(outBinResult, BCDnums);
    BCDto7Seg firstDigit(BCDnums[3:0], outNumbers[6:0], errOut);
    BCDto7Seg secondDigit(BCDnums[7:4], outNumbers[13:7], errOut);
    BCDto7Seg thirdDigit(BCDnums[11:8], outNumbers[20:14], errOut);
    BCDto7Seg fourthDigit(BCDnums[15:12], outNumbers[27:21], errOut);
    BCDto7Seg fifthDigit(BCDnums[19:16], outNumbers[34:28], errOut);
    
    initial 
    begin
       $monitor ("enter:%b, total:%b, clear:%b, number:%b, inputNums:%b, 1st:%b, 2nd:%b, 3rd:%b, 4th:%b, 5th:%b, err:%b, Result: %d ", enter, total, clear, number, inputNums, outNumbers[6:0], outNumbers[13:7], outNumbers[20:14], outNumbers[27:21], outNumbers[34:28], errOut, outBinResult);
       enter = 1'b0; number = 1'b0; total = 1'b0; clear = 1'b0; inputNums = 0;
       #10 inputNums[3] = 1'b1;
       #10 inputNums[3] = 1'b0;
       #10 inputNums[0] = 1'b1;
       #10 inputNums[0] = 1'b0;
       #10 inputNums[0] = 1'b1;
       #10 inputNums[0] = 1'b0;
       #10 enter = 1'b1;
       #10 enter = 1'b0;
//       #10 total = 1'b1;
//       #10 total = 1'b0;
       #10 number = 1'b1;
       #10 number = 1'b0;
       #10 inputNums[2] = 1'b1;
       #10 inputNums[2] = 1'b0;
       #10 inputNums[0] = 1'b1;
       #10 inputNums[0] = 1'b0;
       #10 enter = 1'b1;
       #10 enter = 1'b0;
       #10 total = 1'b1;
       #10 total = 1'b0;
       #10 inputNums[2] = 1'b1;
       #10 inputNums[2] = 1'b0;
       #10 inputNums[5] = 1'b1;
       #10 inputNums[5] = 1'b0;
       #10 inputNums[0] = 1'b1;
       #10 inputNums[0] = 1'b0;
       #10 inputNums[0] = 1'b1;
       #10 inputNums[0] = 1'b0;
       #10 enter = 1'b1;
       #10 enter = 1'b0;
       #10 number = 1'b1;
       #10 number = 1'b0;
       #10 inputNums[4] = 1'b1;
       #10 inputNums[4] = 1'b0;
       #10 inputNums[0] = 1'b1;
       #10 inputNums[0] = 1'b0;
       #10 enter = 1'b1;
       #10 enter = 1'b0;
       #10 total = 1'b1;
       #10 total = 1'b0;
       #10 clear = 1'b1;
       #10 clear = 1'b0;
    end
    
endmodule;
