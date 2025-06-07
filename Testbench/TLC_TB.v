module TLC_TB();
reg clk,rst;
wire [2:0] north,east,south,west;
TLC dut(clk,rst,north,east,south,west);
initial begin
    clk=0;
    forever #5 clk=~clk;
end
initial begin
rst=1;#20
rst=0;#600
$finish;
end
endmodule
