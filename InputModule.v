module InputModule (enter, clear, inputNums, outputBinNum, clk);
    input [9:0]inputNums;
    input enter, clear, clk;
    output reg [13:0]outputBinNum;
    
    reg [13:0] tempOut, temp;
    reg [2:0] counter, counterTemp;
	 reg [11:0] changes;
    
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
           changes = 0;
			  counter = 0;
           counterTemp = 0;
           temp = 0;
           tempOut = 0;
           outputBinNum = 0;
       end
		 
		always@(posedge clk) begin
			if (changes[0] == ~validInputs[0] && validInputs[0] == 1) begin
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
				changes[0] = validInputs[0];
			end
			if (changes[1] == ~validInputs[1] && validInputs[1] == 1) begin
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
				changes[1] = validInputs[1];
			end
			if (changes[2] == ~validInputs[2] && validInputs[2] == 1) begin
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
				changes[2] = validInputs[2];
			end
			if (changes[3] == ~validInputs[3] && validInputs[3] == 1) begin
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
				changes[3] = validInputs[3];
			end
			if (changes[4] == ~validInputs[4] && validInputs[4] == 1) begin
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
				changes[4] = validInputs[4];
			end
			if (changes[5] == ~validInputs[5] && validInputs[5] == 1) begin
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
				changes[5] = validInputs[5];
			end
			if (changes[6] == ~validInputs[6] && validInputs[6] == 1) begin
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
				changes[6] = validInputs[6];
			end
			if (changes[7] == ~validInputs[7] && validInputs[7] == 1) begin
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
				changes[7] = validInputs[7];
			end
			if (changes[8] == ~validInputs[8] && validInputs[8] == 1) begin
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
				changes[8] = validInputs[8];
			end
			if (changes[9] == ~validInputs[9] && validInputs[9] == 1) begin
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
				changes[9] = validInputs[9];
			end
			if (changes[10] == ~enter && enter == 1) begin
				outputBinNum = tempOut;
           tempOut = 0;
           temp = 0;
           counter = 0;
           counterTemp = 0;
				changes[10] = enter;
			end
			if (changes[11] == ~clear && clear == 1) begin
				outputBinNum = 0;
           tempOut = 0;
           temp = 0;
           counter = 0;
           counterTemp = 0;
				changes[11] = clear;
			end
		end
    
 /*   always @(posedge validInputs[0])
       begin
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
       end    */
    
endmodule
