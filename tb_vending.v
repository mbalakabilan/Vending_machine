module tb_vending;
reg clk;
reg reset;
reg coin5;
reg coin10;
wire product;
wire change5;
vending kaab(.clk(clk),.reset(reset),
.coin5(coin5),.coin10(coin10),.product(product),.change5(change5));

always #5 clk=~clk;
initial begin
clk=0;
reset=1;
coin5=0;
coin10=0;
#10 reset=0;

#10;
 coin5=1;
 coin10=0;
$display("coin5 inserted");
$display("stored 5");
#10;
coin5=0;
#10;
 coin5=0;
 coin10=1;
$display("coin 10inserted");
$display("total 15");

#1;
if(product==1&&change5==0)
$display("product was given");
else
$display("error");
#9;
coin10=0;


#10;
coin5=1;
coin10=0;
$display("store 5");
$display(" inserted 5");
#10;
coin5=0;

#10;
coin5=1;
coin10=0;
$display("store 10");
$display(" inserted 5");
#10;
coin5=0;

#10;
coin5=1;
coin10=0;
$display("store 15");
$display(" inserted 5");

#1;


if(product==1&&change5==0)
$display("product was given");
else
$display("no product");
#9;
coin5=0;

#10;
coin10=1;
coin5=1;
$display("10 coin was inserted");
$display(" 10 stored");
#10;
coin10=0;

#10;
coin10=1;
coin5=0;
$display("10 coin was inserted");
$display(" 20 stored");

#1;
if(product==1&&change5==1)
$display("product was given and 5 also given");
else
$display("error");
#9;
coin10=0;

end
endmodule

