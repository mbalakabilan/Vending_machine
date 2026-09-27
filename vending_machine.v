module vending(
input clk,
input reset,
input coin5,
input coin10,
output reg product,
output reg change5
);
reg[0:1]state;
reg[0:1]next_state;

parameter s0=2'b00;
parameter s5=2'b01;
parameter s10=2'b10;
 
always@(posedge clk)begin
if(reset)
state<=s0;
else 
state<=next_state;
end

always@(*)begin

next_state=state;

case(state)
 
s0:begin
if(coin5)
next_state=s5; //5
else if(coin10)
next_state=s10; //10
end

s5:begin
if(coin5)
next_state=s10; //10
else if(coin10)
next_state=s0; //product
end

s10:begin
if(coin10)
next_state=s0; //product 1,change 5
else if(coin5)
next_state=s0; //product 1
end
 default: 
next_state=s0;
endcase
end

always@(*)begin
 product=0;
change5=0;

case(state)
s0:begin
product=0;
change5=0;
end

s5:begin
if(coin10)begin
product=1;
change5=0;
end
else begin
product=0;
change5=0;
end
end

s10:begin
if(coin5)begin
product=1;
change5=0;
end
else if(coin10)begin
product=1;
change5=1;
end
end

default:begin
product=0;
change5=0;
end
endcase
end
endmodule

