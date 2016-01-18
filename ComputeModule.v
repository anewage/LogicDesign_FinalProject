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
			
		end
		if (changes[1] == ~total && total == 1) begin
			show = ~show;
		end
		if (changes[2] == ~enter && enter == 1) begin
			case(cs)
          S0: begin cs = S1; store = ~store; end
          S1: begin cs = S1; store = ~store; end
          S2: begin cs = S1; update = ~update; end
        endcase
			
		end
		if (changes[3] == ~clear && clear == 1) begin
			reset = ~reset;
			cs = S0;
		end
		changes[0] = number;
		changes[3] = clear;
		changes[2] = enter;
		changes[1] = total;
	 end

endmodule