module Module2;
  reg show, reset, store, update;
  reg [13:0] inNumbers;
  wire err;
  wire [34:0] outNumbers;
  ExecutionModule em(inNumbers, show, reset, store, update, outNumbers, err);
  
  initial
    begin
      update = 1'b0;
      reset = 1'b0;
      show = 1'b0;
      store = 1'b0;
      inNumbers = 1250;
      #10 store = ~store;
      #10 show = ~show;
      #10 inNumbers = 1000;
      #10 store = ~store;
      #10 inNumbers = 2;
      #10 update = ~update;
      #10 inNumbers = 100;
      #10 store = ~store;
      #10 show =~show;
    end
endmodule

module ExecutionModule(inNumbers, show, reset, store, update, outNumbers, errIn, errOut);
  input show, reset, store, update, errIn;
  input [13:0] inNumbers;
  output reg[16:0] outNumbers;
  output errOut;
  
  reg overflow;
  
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
  
  always @(posedge show or negedge show)
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
    end
  
endmodule;
