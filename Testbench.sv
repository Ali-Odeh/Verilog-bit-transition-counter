`timescale 1ns / 1ps
 
module TBC;

  reg CLK;
  reg Load;
  reg Clear;
  reg [9:0] Data;
  wire [4:0] Count;
  integer i;

  TC uut (
    .CLK(CLK),
    .Load(Load),
    .Clear(Clear),
    .Data(Data),
    .Count(Count)
  );
//________________
  
    always begin
    #2 CLK = ~CLK;
    end
  
//______________________________
   // { Case 1 }
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;

    CLK = 0;
    Load = 0;
    
    Clear = 1; // OFF
    #2;
    Clear = 0; // ON
    #2;
    Clear = 1; // OFF
    #2;
    
 
    // { Case 2 }
    
    Load = 1;
    
    for (i = 0; i <= 1024; i = i + 1) begin
     #2 CLK = 1;
       Data = i;
     #2 CLK = 0;
      $display("{ Data = %d , Count = %d }", Data, Count);
    end
   
//_________________________________________
    // { Case 3 }
    
   
    Data = 10'b0000000101; 
    Load = 0;    
     
     
    $display("Transformation Count (Load = 0) = %d", Count);
    
    #2;
 //_________________________________________
   
    #10 $finish;  
  end

  
    
  
endmodule
