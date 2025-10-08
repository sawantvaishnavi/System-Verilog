timescale 1ns/1ps;

module tb;

reg [7:0] a = 8'd12;

reg [7:0] b = 8'd34;

int c = 67;

int d = 255;

initial begin

#12;

$display( "a=%d, b=%d, c=%d, d=%d", a, b, c, d);

end

endmodule
