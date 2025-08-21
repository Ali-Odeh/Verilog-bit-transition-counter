  module TC (CLK, Load, Clear, Data, Count);
  input CLK, Load, Clear;
  input [9:0] Data;
  output reg [4:0] Count;
  
  reg [9:0] x;  

  //_______________________________
  
              // Task to Calculate Transformation Count
    task CTF;
      
    input [9:0] X;
    integer i;
      
    Count = 0;
    for (i = 0; i < 9; i = i + 1) begin
      if (X[i] != X[i + 1])
        Count = Count + 1;
    end
  endtask

  //_______________________________

  always @(posedge CLK) begin
    if (Clear == 0) begin
      x <= Data;
      x <= 0;
      Count <= 0;
    end
    else if (Load == 1) begin
      x = Data;
      CTF(x); 
    end
  end

endmodule
