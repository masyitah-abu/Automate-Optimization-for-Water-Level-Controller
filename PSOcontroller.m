clear
clc
%% simple water tank
h = input('Please input water level:' ); %water level
g = 9.81;
a = 0.07;
num = 1;
denom = [1 0]; 
Gp = tf(num,denom); %transfer function 1/s
H = 1;%a*sqrt(2*g*h); %bernuoline equation
M = feedback (Gp,H);
%% PSO controller -- PSO ni random process 
waterlevel=PSOcode(h);  
Mv = feedback(waterlevel*Gp,H);
[y2,t2]=step(h*Mv);
sserror2=abs(h-y2(end));
S2=stepinfo(h*Mv) %PSO
hold on
step(h*Mv)
%% source level
t=(-10:0.001:40)';
y = heaviside(t);
y = h*y;
hold on
plot(t,y)
axis([-3 40 0 h+0.2])
title('PSO controller')
legend('source level','PSO')
%% error table
Title = {'steady state PSO'};
Steady =[sserror2];
result = table(Steady,'RowNames',Title)