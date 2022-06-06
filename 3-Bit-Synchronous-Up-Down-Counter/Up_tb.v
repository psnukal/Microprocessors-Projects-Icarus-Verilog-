//Up Counter
`timescale 1 ns / 100 ps
`define TESTVECS 7

module tb;
  reg clk, reset;
  reg inc; reg count;
  wire [2:0] q; wire cout;
wire [1:0]y;
  integer i;
  initial begin $dumpfile("up.vcd"); $dumpvars(0,tb); end

  initial begin reset = 1'b1;count=1'b1;inc= 1'b0;end
  
  initial clk = 1'b0; always 
	 #5 clk =~ clk;
  
  bit3 b1(.clk(clk),.reset(reset),.count(count),.inc(inc),.cout(cout),.q(q));
  initial begin
    #6 for(i=0;i<`TESTVECS;i=i+1)
      begin #10 
	 reset=1'b0; 
	end
    #100 $finish;
  end
endmodule
