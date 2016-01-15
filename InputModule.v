module InputTest;
    reg enter, clear;
    reg [9:0] inputNums;
    wire valid;
    wire [13:0] outputBinNum;
    InputModule im(enter, clear, inputNums, valid, outputBinNum);
    initial
    begin
        inputNums = 0;
        enter = 0;
        clear = 0;
        #10 inputNums[4] = 1'b1;
        #10 inputNums[4] = 1'b0;
        #10 inputNums[2] = 1'b1;
        #10 inputNums[2] = 1'b0;
        #10 inputNums[0] = 1'b1;
        #10 inputNums[0] = 1'b0;
        #10 enter = 1'b1;
        #10 enter = 1'b0;
        #10 enter = 1'b1;
        #10 enter = 1'b0;
    end
endmodule;

module InputModule (enter, clear, inputNums, valid, outputBinNum);
    input [9:0]inputNums;
    input enter, clear;
    output reg valid;
    output reg [13:0]outputBinNum;
    
    reg [13:0] tempOut, temp;
    reg [2:0] counter, counterTemp;
    
    wire [9:0] validInputs;
    assign validInputs[0] = inputNums[0] & ~inputNums[1] & ~inputNums[2] & ~inputNums[3] & ~inputNums[4] & ~inputNums[5] & ~inputNums[6] & ~inputNums[7] & ~inputNums[8] & ~inputNums[9];
    assign validInputs[1] = ~inputNums[0] & inputNums[1] & ~inputNums[2] & ~inputNums[3] & ~inputNums[4] & ~inputNums[5] & ~inputNums[6] & ~inputNums[7] & ~inputNums[8] & ~inputNums[9];
    assign validInputs[2] = ~inputNums[0] & ~inputNums[1] & inputNums[2] & ~inputNums[3] & ~inputNums[4] & ~inputNums[5] & ~inputNums[6] & ~inputNums[7] & ~inputNums[8] & ~inputNums[9];
    assign validInputs[3] = ~inputNums[0] & ~inputNums[1] & ~inputNums[2] & inputNums[3] & ~inputNums[4] & ~inputNums[5] & ~inputNums[6] & ~inputNums[7] & ~inputNums[8] & ~inputNums[9];
    assign validInputs[4] = ~inputNums[0] & ~inputNums[1] & ~inputNums[2] & ~inputNums[3] & inputNums[4] & ~inputNums[5] & ~inputNums[6] & ~inputNums[7] & ~inputNums[8] & ~inputNums[9];
    assign validInputs[5] = ~inputNums[0] & ~inputNums[1] & ~inputNums[2] & ~inputNums[3] & ~inputNums[4] & inputNums[5] & ~inputNums[6] & ~inputNums[7] & ~inputNums[8] & ~inputNums[9];
    assign validInputs[6] = ~inputNums[0] & ~inputNums[1] & ~inputNums[2] & ~inputNums[3] & ~inputNums[4] & ~inputNums[5] & inputNums[6] & ~inputNums[7] & ~inputNums[8] & ~inputNums[9];
    assign validInputs[7] = ~inputNums[0] & ~inputNums[1] & ~inputNums[2] & ~inputNums[3] & ~inputNums[4] & ~inputNums[5] & ~inputNums[6] & inputNums[7] & ~inputNums[8] & ~inputNums[9];
    assign validInputs[8] = ~inputNums[0] & ~inputNums[1] & ~inputNums[2] & ~inputNums[3] & ~inputNums[4] & ~inputNums[5] & ~inputNums[6] & ~inputNums[7] & inputNums[8] & ~inputNums[9];
    assign validInputs[9] = ~inputNums[0] & ~inputNums[1] & ~inputNums[2] & ~inputNums[3] & ~inputNums[4] & ~inputNums[5] & ~inputNums[6] & ~inputNums[7] & ~inputNums[8] & inputNums[9];
    
    initial 
       begin
 //          $monitor ("enter: %b , clear: %b , validInputs: %b, temp: %d, outputBinNum: %d, counter: %d, inputNums: %b ", enter, clear, validInputs, temp, outputBinNum, counter, inputNums);
           valid = 1'b1;
           counter = 0;
           counterTemp = 0;
           temp = 0;
           tempOut = 0;
           outputBinNum = 0;
       end
    
    always @(posedge validInputs[0])
       begin
           valid = 1'b1;
           if (counter <= 4) begin
               counterTemp = counter + 1;
               counter = counterTemp;
               temp = tempOut * 10 + 0;
               tempOut = temp;
           end
           if (counter > 4) begin
               counterTemp = 0;
               counter = 0;
               tempOut = 0;
               temp = tempOut * 10 + 0;
               tempOut = temp;
           end
       end
       
    always @(posedge validInputs[1])
       begin
           valid = 1'b1;
           if (counter <= 4) begin
               counterTemp = counter + 1;
               counter = counterTemp;
               temp = tempOut * 10 + 1;
               tempOut = temp;
           end
           if (counter > 4) begin
               counterTemp = 0;
               counter = 0;
               tempOut = 0;
               temp = tempOut * 10 + 1;
               tempOut = temp;
           end
       end
    
    always @(posedge validInputs[2])
       begin
           valid = 1'b1;
           if (counter <= 4) begin
               counterTemp = counter + 1;
               counter = counterTemp;
               temp = tempOut * 10 + 2;
               tempOut = temp;
           end
           if (counter > 4) begin
               counterTemp = 0;
               counter = 0;
               tempOut = 0;
               temp = tempOut * 10 + 2;
               tempOut = temp;
           end
       end
    
    always @(posedge validInputs[3])
       begin
           valid = 1'b1;
           if (counter <= 4) begin
               counterTemp = counter + 1;
               counter = counterTemp;
               temp = tempOut * 10 + 3;
               tempOut = temp;
           end
           if (counter > 4) begin
               counterTemp = 0;
               counter = 0;
               tempOut = 0;
               temp = tempOut * 10 + 3;
               tempOut = temp;
           end
       end
       
    always @(posedge validInputs[4])
       begin
           valid = 1'b1;
           if (counter <= 4) begin
               counterTemp = counter + 1;
               counter = counterTemp;
               temp = tempOut * 10 + 4;
               tempOut = temp;
           end
           if (counter > 4) begin
               counterTemp = 0;
               counter = 0;
               tempOut = 0;
               temp = tempOut * 10 + 4;
               tempOut = temp;
           end
       end
    
    always @(posedge validInputs[5])
       begin
           valid = 1'b1;
           if (counter <= 4) begin
               counterTemp = counter + 1;
               counter = counterTemp;
               temp = tempOut * 10 + 5;
               tempOut = temp;
           end
           if (counter > 4) begin
               counterTemp = 0;
               counter = 0;
               tempOut = 0;
               temp = tempOut * 10 + 5;
               tempOut = temp;
           end
       end
    
    always @(posedge validInputs[6])
       begin
           valid = 1'b1;
           if (counter <= 4) begin
               counterTemp = counter + 1;
               counter = counterTemp;
               temp = tempOut * 10 + 6;
               tempOut = temp;
           end
           if (counter > 4) begin
               counterTemp = 0;
               counter = 0;
               tempOut = 0;
               temp = tempOut * 10 + 6;
               tempOut = temp;
           end
       end
    
    always @(posedge validInputs[7])
       begin
           valid = 1'b1;
           if (counter <= 4) begin
               counterTemp = counter + 1;
               counter = counterTemp;
               temp = tempOut * 10 + 7;
               tempOut = temp;
           end
           if (counter > 4) begin
               counterTemp = 0;
               counter = 0;
               tempOut = 0;
               temp = tempOut * 10 + 7;
               tempOut = temp;
           end
       end
       
    always @(posedge validInputs[8])
       begin
           valid = 1'b1;
           if (counter <= 4) begin
               counterTemp = counter + 1;
               counter = counterTemp;
               temp = tempOut * 10 + 8;
               tempOut = temp;
           end
           if (counter > 4) begin
               counterTemp = 0;
               counter = 0;
               tempOut = 0;
               temp = tempOut * 10 + 8;
               tempOut = temp;
           end
       end
       
    always @(posedge validInputs[9])
       begin
           valid = 1'b1;
           if (counter <= 4) begin
               $display("hit me!");
               counterTemp = counter + 1;
               counter = counterTemp;
               temp = tempOut * 10 + 9;
               tempOut = temp;
           end
           if (counter > 4) begin
               counterTemp = 0;
               counter = 0;
               tempOut = 0;
               temp = tempOut * 10 + 9;
               tempOut = temp;
           end
       end
    
    always @(posedge enter)
       begin
           outputBinNum = tempOut;
           tempOut = 0;
           temp = 0;
           counter = 0;
           counterTemp = 0;
       end
       
    always @(posedge clear)
       begin
           outputBinNum = 0;
           tempOut = 0;
           temp = 0;
           counter = 0;
           counterTemp = 0;
       end    
    
endmodule;
