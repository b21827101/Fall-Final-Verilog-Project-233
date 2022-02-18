`timescale 1 s / 1s

module scp_079(input green,input yellow,input red,input clock,
output [2:0] state,input [5:0]timer,
output reg a1,output reg a2,output reg  a3,output reg cheat_out);
//a1:attack security output 
//a2:attack database output
//a3:attack control system output
reg [2:0]state;
reg [2:0]next_state=3'b000;

parameter s0 =3'b000, s1 = 3'b001 , s2 =3'b010,
          s3 =3'b011, s4 = 3'b100, s5= 3'b101;
          //s0:lay low state s1:cheat state s2:attack security state
          //s3:attack database state s4:fail state s5:connect state
          

always@(posedge clock)begin
state<=next_state;
end

always @(state,red,green,yellow,timer)begin
case(state)

s0: 
if(red ==1) begin 
next_state =s1;
cheat_out=1;
end

else if(green == 1 && red==0 && yellow==0 && timer>=6'b100011)begin 
next_state = s2; 
a1=1 ;
end

else if(yellow == 1 && red==0) begin
a1=0;a2=0;a3=0;
next_state = s0;
end

s1: if(red ==1 && timer>=6'b011001) begin 
next_state = s4;
end

else if(red==0 && timer>=6'b011001)begin 
    next_state = s0; 
    a1=0; a2=0; a3=0;
    cheat_out=0;
    end

s2: if(green == 1 && red==0 && yellow==0 && timer==6'b010100) begin 
next_state = s3;
a2 = 1;
end
else if(red ==1) begin 
cheat_out=1;
next_state =s1;
end
else if(yellow ==1 && red==0) begin 
next_state =s0; 
a1 =0;
end

s3: 
if(red==1) begin 
 cheat_out=1;
 next_state=s1;
end

else if(yellow == 1 && red==0) begin
a2 =1;
next_state = s2;
end

else if(green == 1 && red==0 && yellow==0 && timer == 6'b001001)begin
 a3 =1; 
 next_state = s5;
end
s4:begin end

s5:begin end
default begin a1=0; a2=0; a3=0; cheat_out =0; state = 3'b000; end

endcase
end
endmodule