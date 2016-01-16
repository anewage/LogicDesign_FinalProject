module Module1;
  reg enter, number, total, clear, valid;
  wire update, show, store, reset;
  ComputeModule cp(enter, number, total, clear, update, show, store, reset, valid);
  initial
    begin
      enter = 1'b0; number = 1'b0; total = 1'b0; clear = 1'b0; valid = 1'b1;
      #10 number = ~number; 

    end
endmodule

module ComputeModule(enter, number, total, clear, update, show, store, reset, valid);
  
  input enter, number, total, clear, valid;
  output reg update, show, store, reset;
  reg[1:0] cs;
  parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b11;
  initial
    begin
 //     $monitor("State is : %b ", cs);
      update <= 1'b0;
      show <= 1'b0;
      store <= 1'b0;
      reset <= 1'b0;
      cs <= S0;
    end
    
  always @(posedge number)
    begin
        if (cs == S1)
          cs <= S2;
    end
  
  always @(posedge total)
    begin
        show <= ~show;
    end

  always @(posedge enter)
      if (valid == 1'b1) begin
        case(cs)
          S0: begin cs <= S1; store <= ~store; end
          S1: begin cs <= S1; store <= ~store; end
          S2: begin cs <= S1; update <= ~update; end
        endcase
      end
    
  always @(posedge clear)
    begin
        reset <= 1'b1;
        cs <= S0;
    end

endmodule;