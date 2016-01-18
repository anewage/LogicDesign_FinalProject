module InputModule (enter, clear, inputNums, outputBinNum, clk);
    input [9:0]inputNums;
    input enter, clear, clk;
    output reg [13:0]outputBinNum;
    
    reg [13:0] tempOut, temp;
    reg [2:0] counter, counterTemp;
	 reg [11:0] changes;
    
    reg [9:0] validInputs;
	 
     
    
    initial 
       begin
           $monitor ("enter: %b , clear: %b , validInputs: %b, temp: %d, outputBinNum: %d, counter: %d, inputNums: %b ", enter, clear, validInputs, temp, outputBinNum, counter, inputNums);
           changes = 0;
			  validInputs = 0;
			  counter = 0;
           counterTemp = 0;
           temp = 0;
           tempOut = 0;
           outputBinNum = 0;
       end
		 
		always@(posedge clk) begin
			validInputs[0] = inputNums[0] & ~inputNums[1] & ~inputNums[2] & ~inputNums[3] & ~inputNums[4] & ~inputNums[5] & ~inputNums[6] & ~inputNums[7] & ~inputNums[8] & ~inputNums[9];
			validInputs[1] = ~inputNums[0] & inputNums[1] & ~inputNums[2] & ~inputNums[3] & ~inputNums[4] & ~inputNums[5] & ~inputNums[6] & ~inputNums[7] & ~inputNums[8] & ~inputNums[9];
			validInputs[2] = ~inputNums[0] & ~inputNums[1] & inputNums[2] & ~inputNums[3] & ~inputNums[4] & ~inputNums[5] & ~inputNums[6] & ~inputNums[7] & ~inputNums[8] & ~inputNums[9];
			validInputs[3] = ~inputNums[0] & ~inputNums[1] & ~inputNums[2] & inputNums[3] & ~inputNums[4] & ~inputNums[5] & ~inputNums[6] & ~inputNums[7] & ~inputNums[8] & ~inputNums[9];
			validInputs[4] = ~inputNums[0] & ~inputNums[1] & ~inputNums[2] & ~inputNums[3] & inputNums[4] & ~inputNums[5] & ~inputNums[6] & ~inputNums[7] & ~inputNums[8] & ~inputNums[9];
			validInputs[5] = ~inputNums[0] & ~inputNums[1] & ~inputNums[2] & ~inputNums[3] & ~inputNums[4] & inputNums[5] & ~inputNums[6] & ~inputNums[7] & ~inputNums[8] & ~inputNums[9];
			validInputs[6] = ~inputNums[0] & ~inputNums[1] & ~inputNums[2] & ~inputNums[3] & ~inputNums[4] & ~inputNums[5] & inputNums[6] & ~inputNums[7] & ~inputNums[8] & ~inputNums[9];
			validInputs[7] = ~inputNums[0] & ~inputNums[1] & ~inputNums[2] & ~inputNums[3] & ~inputNums[4] & ~inputNums[5] & ~inputNums[6] & inputNums[7] & ~inputNums[8] & ~inputNums[9];
			validInputs[8] = ~inputNums[0] & ~inputNums[1] & ~inputNums[2] & ~inputNums[3] & ~inputNums[4] & ~inputNums[5] & ~inputNums[6] & ~inputNums[7] & inputNums[8] & ~inputNums[9];
			validInputs[9] = ~inputNums[0] & ~inputNums[1] & ~inputNums[2] & ~inputNums[3] & ~inputNums[4] & ~inputNums[5] & ~inputNums[6] & ~inputNums[7] & ~inputNums[8] & inputNums[9];
			
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
			   
			end
			if (changes[10] == ~enter && enter == 1) begin
				outputBinNum = tempOut;
           tempOut = 0;
           temp = 0;
           counter = 0;
           counterTemp = 0;
				
			end
			if (changes[11] == ~clear && clear == 1) begin
				outputBinNum = 0;
           tempOut = 0;
           temp = 0;
           counter = 0;
           counterTemp = 0;
				
			end
		   	changes[0] = validInputs[0];
				changes[1] = validInputs[1];
				changes[2] = validInputs[2];
				changes[3] = validInputs[3];
				changes[4] = validInputs[4];
				changes[5] = validInputs[5];
				changes[6] = validInputs[6];
				changes[7] = validInputs[7];
				changes[8] = validInputs[8];
				changes[9] = validInputs[9];
				changes[10] = enter;
				changes[11] = clear;
		end
endmodule
