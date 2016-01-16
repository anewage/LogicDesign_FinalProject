module BinaryToBCD (inNum, outBCD, clk);
    input [16:0] inNum;
	 input clk;
    output reg [19:0] outBCD;
    
    always@(posedge clk)
    begin
        outBCD[3:0] = inNum % 10;
        outBCD[7:4] = (inNum % 100) / 10;
        outBCD[11:8] = (inNum % 1000) / 100 ;
        outBCD[15:12] = (inNum % 10000) / 1000;
        outBCD[19:16] = (inNum % 100000) / 10000;
    end
    
endmodule