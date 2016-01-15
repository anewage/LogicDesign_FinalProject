module segTest;
    reg [3:0] inNum;
    wire[6:0] out;
    BCDto7Seg bt7(inNum, out);
    initial
    begin
        $monitor("out is : %b" , out);
        inNum = 0;
        #10 inNum = 1;
        #10 inNum = 2;
        #10 inNum = 3;
        #10 inNum = 4;
        #10 inNum = 5;
        #10 inNum = 6;
        #10 inNum = 7;
        #10 inNum = 8;
        #10 inNum = 9;
    end
    
endmodule;

module BCDto7Seg(inNum, sevenSegOut);
    input [3:0] inNum;
    output[6:0] sevenSegOut;
    
    assign sevenSegOut[0] = inNum[3] | (inNum[2] & inNum[0]) | inNum[1] | (~inNum[2] & ~inNum[0]);//a
    assign sevenSegOut[1] = inNum[3] | (~inNum[1] & ~inNum[0]) | (inNum[1] & inNum[0]) | ~inNum[2];//b
    assign sevenSegOut[2] = inNum[3] | inNum[2] | ~inNum[1] | inNum[0];//c
    assign sevenSegOut[3] = (~inNum[2] & ~inNum[0]) | (inNum[1] & ~inNum[0]) | (inNum[2] & ~inNum[1] & inNum[0]) | (~inNum[2] & inNum[1]);//d
    assign sevenSegOut[4] = (~inNum[2] & ~inNum[0]) | (inNum[1] & ~inNum[0]);//e
    assign sevenSegOut[5] = inNum[3] | (~inNum[1] & ~inNum[0]) | (inNum[2] & ~inNum[0]) | (inNum[2] & ~inNum[1]);//f
    assign sevenSegOut[6] = inNum[3] | (inNum[1] & ~inNum[0]) | (inNum[2] & ~inNum[1]) | (~inNum[2] & inNum[1]);//g
    
endmodule;