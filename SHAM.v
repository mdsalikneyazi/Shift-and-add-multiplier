module SHAM(
    input clk,
    input rst,
    input [3:0] A,
    input [3:0] B,
    output [7:0]  P
);

reg [3:0] Q;
reg [4:0] a;
reg [2:0] count;
reg [8:0] temp;

assign P = {a[3:0],Q};

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        a <= 0;
        Q <= B;
        count <= 0;
    end

    else if(count < 4)
    begin
        temp = {a,Q};

        if(Q[0])
            temp[8:4] = a + A;

        temp = temp >> 1;

        a <= temp[8:4];
        Q <= temp[3:0];

        count <= count + 1;
    end
end

endmodule