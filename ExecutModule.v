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

module ExecutionModule(inNumbers, show, reset, store, update, outNumbers, err);
  input show, reset, store, update;
  input [13:0] inNumbers;
  output reg[34:0] outNumbers;
  output reg err;
  
  reg [16:0] total, temp, temp2;
  
  initial
    begin
      
      $monitor("total : %d, \t temp: %d, \t temp2: %d, err: %b, inNumbers: %d ", total, temp, temp2, err, inNumbers);
      outNumbers = 0;
      total = 0;
      temp = 0;
      temp2 = 0;
      err = 1'b0;
      $display("total is : %d, \t temp: %d, \t temp2: %d, err: %b, inNumbers: %d ", total, temp, temp2, err, inNumbers);
    end
  
  always @(posedge show or negedge show)
    begin
      $display("show");
      temp2 = total + temp;
      total = temp2;
      temp = 0;
      temp2 = 0;
      //total should be appeared in the output
    end
  
  always @(posedge reset or negedge reset)
    begin
      $display("reset");
      total = 0;
      temp = 0;
      temp2 = 0;  
    end
    
  always @(posedge store or negedge store)
    begin
      $display("store");
      temp2 = temp + total;
      total = temp2;
      temp = 0;
      temp = inNumbers * 1;
    end
  
  always @(posedge update or negedge update)
    begin
      $display("update");
      if( inNumbers * temp > 99999)
        err = 1'b1;
      else begin
        temp = inNumbers * temp;
      end
    end
  
endmodule;
