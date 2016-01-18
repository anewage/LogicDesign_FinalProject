module Controller(enterIn, numberIn, totalIn, clearIn, enterOut, numberOut, totalOut, clearOut, err ,clk);
   input enterIn, numberIn, totalIn, clearIn , clk;
   output reg enterOut, numberOut, totalOut, clearOut, err;
   
	always @(posedge clk)
	begin
    enterOut = enterIn & ~numberIn & ~totalIn & ~clearIn;
    numberOut = ~enterIn & numberIn & ~totalIn & ~clearIn;
    totalOut = ~enterIn & ~numberIn & totalIn & ~clearIn;
    clearOut = ~enterIn & ~numberIn & ~totalIn & clearIn;
    err = (enterIn & numberIn) | (enterIn & totalIn) | (enterIn & clearIn) | (numberIn & totalIn) | (numberIn & clearIn) | (totalIn & clearIn);
	end
endmodule