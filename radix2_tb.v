`timescale 1ns/100ps
module radix2_tb (
);
    reg  [15:0] x,y,n;
    reg clk,rst;
    wire [15:0] S;
    wire [3:0] k,i;
    wire q,f;
	wire [15:0] temp;

    radix2 r(
    .x(x),.y(y),.n(n),.clk(clk),.S(S),.k(k),.i(i),.q(q),.f(f),.temp(temp),.rst(rst)
    );

    initial begin
        $dumpfile("radix2.vcd");
        $dumpvars(0, radix2_tb);
        clk=0;
        rst=1;
        x=16'd25;
        y=16'd17;
        n=16'd23;
        #12 rst=0;
        #58 rst=1;
         x=16'd25;
         y=16'd17;
         n=16'd23;
        #12 rst=0;
        #160 $stop;

    end

    always #2 clk=~clk;

endmodule