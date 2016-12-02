module ex4_5_testbench();
  logic data[3:0];
  logic segments[6:0];
  
  sevenseg dut(data[3:0], segments[6:0]);
  
  initial begin
    data = '{0, 0, 0, 0}; #10;
    data = '{0, 0, 0, 1}; #10;
    data = '{0, 0, 1, 0}; #10;
    data = '{0, 0, 1, 1}; #10;
    data = '{0, 1, 0, 0}; #10;
    data = '{0, 1, 0, 1}; #10;
    data = '{0, 1, 1, 0}; #10;
    data = '{0, 1, 1, 1}; #10;
    data = '{1, 0, 0, 0}; #10;
    data = '{1, 0, 0, 1}; #10;
    data = '{1, 0, 1, 0}; #10;
    data = '{1, 0, 1, 1}; #10;
    data = '{1, 1, 0, 0}; #10;
    data = '{1, 1, 0, 1}; #10;
    data = '{1, 1, 1, 0}; #10;
    data = '{1, 1, 1, 1}; #10;
  end
endmodule  
