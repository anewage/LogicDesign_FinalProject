module Controller(enterIn, numberIn, totalIn, clearIn, enterOut, numberOut, totalOut, clearOut, err);
   input enterIn, numberIn, totalIn, clearIn;
   output enterOut, numberOut, totalOut, clearOut, err;
   
   assign enterOut = enterIn & ~numberIn & ~totalIn & ~clearIn;
   assign numberOut = ~enterIn & numberIn & ~totalIn & ~clearIn;
   assign totalOut = ~enterIn & ~numberIn & totalIn & ~clearIn;
   assign clearOut = ~enterIn & ~numberIn & ~totalIn & clearIn;
   assign err = (enterIn & numberIn) | (enterIn & totalIn) | (enterIn & clearIn) | (numberIn & totalIn) | (numberIn & clearIn) | (totalIn & clearIn);
endmodule