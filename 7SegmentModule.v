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

module BCDto7Seg(inNum, sevenSegOut, err);
    input [3:0] inNum;
    input err;
    output reg[6:0] sevenSegOut;
    
 /*   assign sevenSegOut[0] = inNum[3] | (inNum[2] & inNum[0]) | inNum[1] | (~inNum[2] & ~inNum[0]);//a
    assign sevenSegOut[1] = inNum[3] | (~inNum[1] & ~inNum[0]) | (inNum[1] & inNum[0]) | ~inNum[2];//b
    assign sevenSegOut[2] = inNum[3] | inNum[2] | ~inNum[1] | inNum[0];//c
    assign sevenSegOut[3] = (~inNum[2] & ~inNum[0]) | (inNum[1] & ~inNum[0]) | (inNum[2] & ~inNum[1] & inNum[0]) | (~inNum[2] & inNum[1]);//d
    assign sevenSegOut[4] = (~inNum[2] & ~inNum[0]) | (inNum[1] & ~inNum[0]);//e
    assign sevenSegOut[5] = inNum[3] | (~inNum[1] & ~inNum[0]) | (inNum[2] & ~inNum[0]) | (inNum[2] & ~inNum[1]);//f
    assign sevenSegOut[6] = inNum[3] | (inNum[1] & ~inNum[0]) | (inNum[2] & ~inNum[1]) | (~inNum[2] & inNum[1]);//g
   */ 
    always @ (*)
    begin
        if (~err) begin
             sevenSegOut[0] = inNum[3] | (inNum[2] & inNum[0]) | inNum[1] | (~inNum[2] & ~inNum[0]);//a
             sevenSegOut[1] = inNum[3] | (~inNum[1] & ~inNum[0]) | (inNum[1] & inNum[0]) | ~inNum[2];//b
             sevenSegOut[2] = inNum[3] | inNum[2] | ~inNum[1] | inNum[0];//c
             sevenSegOut[3] = (~inNum[2] & ~inNum[0]) | (inNum[1] & ~inNum[0]) | (inNum[2] & ~inNum[1] & inNum[0]) | (~inNum[2] & inNum[1]);//d
             sevenSegOut[4] = (~inNum[2] & ~inNum[0]) | (inNum[1] & ~inNum[0]);//e
             sevenSegOut[5] = inNum[3] | (~inNum[1] & ~inNum[0]) | (inNum[2] & ~inNum[0]) | (inNum[2] & ~inNum[1]);//f
             sevenSegOut[6] = inNum[3] | (inNum[1] & ~inNum[0]) | (inNum[2] & ~inNum[1]) | (~inNum[2] & inNum[1]);//g
        end
        if (err) begin
           sevenSegOut[0] = 1'b1;
           sevenSegOut[3] = 1'b1;
           sevenSegOut[4] = 1'b1;
           sevenSegOut[5] = 1'b1;
           sevenSegOut[6] = 1'b1;
           sevenSegOut[1] = 1'b0;
           sevenSegOut[2] = 1'b0;
        end
    end
    
endmodule;