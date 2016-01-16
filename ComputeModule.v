module ComputeModule(enter, number, total, clear, update, show, store, reset, clk);
  
  input enter, number, total, clear, clk;
  output reg update, show, store, reset;
  reg[1:0] cs;
  reg[3:0] changes;
  parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b11;
  
  initial
    begin
		changes = 0;
      update = 1'b0;
      show = 1'b0;
      store = 1'b0;
      reset = 1'b0;
      cs = S0;
    end
	 
	 always@(posedge clk) begin
		if (changes[0] == ~number && number == 1) begin
			if (cs == S1)
				cs = S2;
			changes[0] = number;
		end
		if (changes[1] == ~total && total == 1) begin
			show = ~show;
			changes[1] = total;
		end
		if (changes[2] == ~enter && enter == 1) begin
			case(cs)
          S0: begin cs = S1; store = ~store; end
          S1: begin cs = S1; store = ~store; end
          S2: begin cs = S1; update = ~update; end
        endcase
			changes[2] = enter;
		end
		if (changes[3] == ~clear && clear == 1) begin
			reset = 1'b1;
			cs = S0;
			changes[3] = clear;
		end
		
	 end
    
 /* always @(posedge number)
    begin
        if (cs == S1)
          cs <= S2;
    end
  
  always @(posedge total)
    begin
        show <= ~show;
    end

  always @(posedge enter)
      begin
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
    end*/

endmodule