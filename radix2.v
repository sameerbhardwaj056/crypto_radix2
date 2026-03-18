module radix2(
    input [15:0] x,y,n,
    input clk,rst,
    output reg [15:0] S,
    output reg [3:0] k,i,
    output reg q,f,g,
	output reg [15:0] temp
);
    

    always @(negedge rst ) begin // Bit calculator N-> k
        casez (n)
            15'b1zzzzzzzzzzzzzz : k=4'd15;
            15'b01zzzzzzzzzzzzz : k=4'd14;
            15'b001zzzzzzzzzzzz : k=4'd13;
            15'b0001zzzzzzzzzzz : k=4'd12;
            15'b00001zzzzzzzzzz : k=4'd11;
            15'b000001zzzzzzzzz : k=4'd10;
            15'b0000001zzzzzzzz : k=4'd9;
            15'b00000001zzzzzzz : k=4'd8;
            15'b000000001zzzzzz : k=4'd7;
            15'b0000000001zzzzz : k=4'd6;
            15'b00000000001zzzz : k=4'd5;
            15'b000000000001zzz : k=4'd4;
            15'b0000000000001zz : k=4'd3;
            15'b00000000000001z : k=4'd2;
            15'b000000000000001 : k=4'd1;
        endcase
    end

    always @(*) begin

        q<=S[0]^(x[i]&y[0]);
    end

    always @(posedge clk) begin
        if(rst) begin 
				S<=16'd0; 
				temp<=16'd0;
				i=4'b0000; g=0;
		  end
 
        else if(i<k) begin
            if(g==0&&!rst) begin
                temp<=S+x[i]*y+q*n;
                g<=1;
            end
			else begin
                S<=temp>>1;
				i=i+1;
                g<=0;
            end	
        end

        if(i>=k) begin
            if(S>n) S<=S-n;
        end
    end 


endmodule 
