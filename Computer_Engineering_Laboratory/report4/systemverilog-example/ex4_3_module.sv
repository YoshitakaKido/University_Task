module gates(input logic a[3:0],
             output y);
  
  assign y = (a[0] ^ a[1]) ^ (a[2] ^ a[3]);
  
endmodule
