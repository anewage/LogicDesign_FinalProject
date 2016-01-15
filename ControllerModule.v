module testbench;
  reg enterIn, numberIn, totalIn, clearIn;
  wire enterOut, numberOut, totalOut, clearOut, err;
  Controller c(enterIn, numberIn, totalIn, clearIn, enterOut, numberOut, totalOut, clearOut, err);
  initial
    begin
      enterIn = 1'b0; numberIn = 1'b0; totalIn = 1'b0; clearIn = 1'b0;
      #10 enterIn = 1'b1;
      #10 numberIn = 1'b1;
      #10 enterIn = 1'b0;
      #10 numberIn = 1'b0; totalIn = 1'b1;

    end    
endmodule

module Controller(enterIn, numberIn, totalIn, clearIn, enterOut, numberOut, totalOut, clearOut, err);
   input enterIn, numberIn, totalIn, clearIn;
   output enterOut, numberOut, totalOut, clearOut, err;
   
   assign enterOut = enterIn & ~numberIn & ~totalIn & ~clearIn;
   assign numberOut = ~enterIn & numberIn & ~totalIn & ~clearIn;
   assign totalOut = ~enterIn & ~numberIn & totalIn & ~clearIn;
   assign clearOut = ~enterIn & ~numberIn & ~totalIn & clearIn;
   assign err = (enterIn & numberIn) | (enterIn & totalIn) | (enterIn & clearIn) | (numberIn & totalIn) | (numberIn & clearIn) | (totalIn & clearIn);
endmodule