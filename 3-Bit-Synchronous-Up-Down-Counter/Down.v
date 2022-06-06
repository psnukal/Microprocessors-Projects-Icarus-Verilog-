
module df (input wire clk, in, output wire out);
  reg df_out;
  always@(posedge clk) df_out <= in;
  assign out = df_out;
endmodule

module dfr (input wire clk, set, in, output wire out);
  wire df_in;
  or2 or2_0 (in, set, df_in);
  df df_0 (clk, df_in, out);
endmodule

module or2 (input wire i0, i1, output wire o);
  assign o = i0 | i1;
endmodule

module and2 (input wire i0, i1, output wire o);
  assign o = i0 & i1;
endmodule
 

module xor2 (input wire i0, i1, output wire o);
  assign o = i0 ^ i1;
endmodule

module count1(input wire clk,set,count,inc,output wire cout,q);
wire w1,w2,w3;
assign w1=q;
xor2 x1(w1,inc,w3);
and2 a1(count,w3,cout);
xor2 x2(count,w1,w2);
dfr d1(clk,set,w2,q);
endmodule

module bit3(input wire clk,set,count,inc,output wire cout,output wire [2:0]q);
wire y[1:0];
count1 c1(clk,set,count,inc,y[0],q[0]);
count1 c2(clk,set,y[0],inc,y[1],q[1]);
count1 c3(clk,set,y[1],inc,cout,q[2]);
endmodule



