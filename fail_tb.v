module fail_tb;

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
for(integer i=0;i<35;i=i+1)//state0
    begin timer=timer+1; #1; 
    end
 timer=0;
for(integer i=0;i<5;i=i+1)//state2
    begin timer=timer+1; #1;end 
   
timer=0;green=0;red=1; 
for(integer i=0;i<25;i=i+1)//state1
    begin timer=timer+1; #1 ; end
    
timer=0;    
for(integer i=0;i<12;i=i+1)//state4
    begin timer=timer+1;#1;end 

$finish;  
end
endmodule


