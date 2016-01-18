module ExecutionModule(inNumbers, show, reset, store, update, outNumbers, errIn, errOut, clk);
  input show, reset, store, update, errIn, clk;
  input [13:0] inNumbers;
  output reg[16:0] outNumbers;
  output reg errOut;
  
  reg overflow;
  reg [3:0] changes;
  always @(posedge clk)
  begin
   errOut = errIn | overflow;
  end
  
  reg [16:0] total, temp, temp2;
  
  initial
    begin    
      changes = 0;
      outNumbers = 0;
      total = 0;
      temp = 0;
      temp2 = 0;
      overflow = 1'b0;
    end
always@(posedge clk) begin
		if (changes[0] == ~show) begin
			if (errOut == 0)    begin
				temp2 = total + temp;
				total = temp2;
				temp = 0;
				temp2 = 0;
				outNumbers = total;
			end
			
		end
		if (changes[1] == ~reset) begin
				total = 0;
				temp = 0;
				temp2 = 0; 
				outNumbers = 0; 
				overflow = 1'b0;
		end
		if (changes[2] == ~store) begin
		  if (overflow == 1)
		    overflow = 0;
			temp2 = temp + total;
			total = temp2;
			temp = 0;
			temp = inNumbers * 1;
			outNumbers = total;
		end
		if (changes[3] == ~update) begin
			if( inNumbers * temp > 99999 || inNumbers > 99 )
				overflow = 1'b1;
			if ( inNumbers * temp <= 99999 && inNumbers <=99 ) begin
				temp2 = inNumbers * temp;
				temp = temp2; // ERROR 
			end
		end
		
		changes[2] = store;
		changes[3] = update;
		changes[0] = show;
		changes[1] = reset;
end
  
endmodule
