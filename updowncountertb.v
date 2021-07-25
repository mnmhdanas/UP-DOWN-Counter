
module updowncountertb();
  reg clk,rst,cntrl;
  wire [3:0] count;
  updowncounter c(clk,cntrl,rst,count);
  
  initial 
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end
  
  initial 
    begin
      
      $monitor("%7d %1b %1b %1b %4b ",$time,cntrl,clk,rst,count);
      $display("time cntrl clk rst count");
      #10 rst=1; cntrl=1;
      #10 rst=0;
      #60 cntrl =0;
      #100 cntrl =1;
      #30 rst =1;
      #10 rst =0;
    end
  
  initial 
    begin
      $dumpfile("updowncountertb.vcd");
      $dumpvars(0,updowncountertb);
      #400 $finish;
    end
  
endmodule
