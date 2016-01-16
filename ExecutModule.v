module ExecutionModule(inNumbers, show, reset, store, update, outNumbers, errIn, errOut, clk);
  input show, reset, store, update, errIn, clk;
  input [13:0] inNumbers;
  output reg[16:0] outNumbers;
  output errOut;
  
  reg overflow;
  reg [3:0] changes;
  assign errOut = errIn | overflow;
  
  reg [16:0] total, temp, temp2;
  
  initial
    begin
      
      //$monitor("total : %d, \t temp: %d, \t temp2: %d, errIn: %b, overflow: %b, errOut: %b, inNumbers: %d ", total, temp, temp2, errIn, overflow, errOut, inNumbers);
      outNumbers = 0;
      total = 0;
      temp = 0;
      temp2 = 0;
      overflow = 1'b0;
    end
  always@(posedge clk) begin
		if (changes[0] == ~show) begin
			if (~errOut)    begin
				temp2 = total + temp;
				total = temp2;
				temp = 0;
				temp2 = 0;
				outNumbers = total;
			end
			changes[0] = show;
		end
		if (changes[1] == ~reset) begin
			if (~errOut)    begin
				total = 0;
				temp = 0;
				temp2 = 0; 
				outNumbers = 0; 
				overflow = 1'b0;
			end
			changes[1] = reset;
		end
		if (changes[2] == ~store) begin
			temp2 = temp + total;
			total = temp2;
			temp = 0;
			temp = inNumbers * 1;
			outNumbers = total;
			changes[2] = store;
		end
		if (changes[3] == ~update) begin
			if( inNumbers * temp > 99999 || inNumbers > 99 )
				overflow = 1'b1;
			else begin
				temp2 = inNumbers * temp;
				temp = temp2; // ERROR
			end
			changes[3] = update;
		end
	end
  /*always @(posedge show or negedge show)
  begin
      if (~errOut)    begin
      temp2 = total + temp;
      total = temp2;
      temp = 0;
      temp2 = 0;
      outNumbers = total;
  end
    end
  
  always @(posedge reset or negedge reset)
    begin
      total = 0;
      temp = 0;
      temp2 = 0; 
      outNumbers = 0; 
      overflow = 1'b0;
    end
    
  always @(posedge store or negedge store)
    begin
      temp2 = temp + total;
      total = temp2;
      temp = 0;
      temp = inNumbers * 1;
      outNumbers = total;
    end
  
  always @(posedge update or negedge update)
    begin
      if( inNumbers * temp > 99999 || inNumbers > 99 )
        overflow = 1'b1;
      else begin
        temp2 = inNumbers * temp;
        temp = temp2; // ERROR
      end
    end*/
  
endmodule
