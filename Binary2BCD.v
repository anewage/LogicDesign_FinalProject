module testBTB;
    reg [16:0] inNum;
    wire [19:0] BCD;
    BinaryToBCD BTB(inNum, BCD);
    
    initial
    begin
        $monitor("%d %d %d %d %d", BCD[19:16], BCD[15:12], BCD[11:8], BCD[7:4], BCD[3:0]);
        inNum = 0;
        #10 inNum = 43456;
        #10 inNum = 999;
        #10 inNum = 43725;
        #10 inNum = 100000;
        
    end
    
endmodule;

module BinaryToBCD (inNum, outBCD);
    input [16:0] inNum;
    output reg [19:0] outBCD;
    
    always@(*)
    begin
        outBCD[3:0] = inNum % 10;
        outBCD[7:4] = (inNum % 100) / 10;
        outBCD[11:8] = (inNum % 1000) / 100 ;
        outBCD[15:12] = (inNum % 10000) / 1000;
        outBCD[19:16] = (inNum % 100000) / 10000;
    end
    
endmodule;