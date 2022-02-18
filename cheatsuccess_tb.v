
module cheatsuccess_tb;

reg green;
reg yellow;
reg red;
reg clock;
wire [2:0] state;
reg [5:0]timer;
wire a1;
wire a2;
wire a3;
wire cheat_out;
//Instantiate scp079
scp_079 s(.green(green),.yellow(yellow),.red(red),.clock(clock),.state(state),
.a1(a1),.a2(a2),.a3(a3),.timer(timer),.cheat_out(cheat_out));  


initial begin
  green=1;yellow=0;red=0; timer=0;//Initial color situations
  clock=1;
  #0.5 clock  = 1; 

 end

//Generate a clock with period
  always begin clock = ~clock; 
   #0.5; 
   end

initial begin//Test sequence
for(integer i=0;i<35;i=i+1) //state0
    begin timer=timer+1; #1;end 
    timer=0;

for(integer i=0;i<5;i=i+1)//state2
    begin timer=timer+1; #1;end 
  
 green=0;yellow=0;red=1; timer=0;
for(integer i=0;i<25;i=i+1)begin//state1
if(timer==24)begin  
red=0; 
end
timer=timer+1;#1;end
     
green=1;yellow=0;red=0; timer=0;
for(integer i=0;i<35;i=i+1)begin//state0
if(timer==34)begin  
green=1;end
timer=timer+1;#1;
end
 
 green=1;yellow=0;red=0; timer=0;
for(integer i=0;i<20;i=i+1)//state2
    begin timer=timer+1; #1;end 
    timer=0;
for(integer i=0;i<9;i=i+1)//state3
    begin timer=timer+1; #1;end 
    timer=0;
for(integer i=0;i<36;i=i+1)//state5
    begin timer=timer+1; #1;end 
    
    $finish;  
end
endmodule