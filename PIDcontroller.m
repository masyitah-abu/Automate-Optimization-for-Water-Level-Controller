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
%% PID controller
Kp = 1;
Ki = 0;
Kd = 0;
Gc = pid(Kp, Ki, Kd);
Mc = feedback(Gc*Gp, H);
[y1,t1]=step(h*Mc);
sserror1=abs(h-y1(end));
S1=stepinfo(h*Mc); %PID
step(h*Mc)
%% source level
t=(-10:0.001:40)';
y = heaviside(t);
y = h*y;
hold on
plot(t,y)
axis([-3 40 0 h+0.2])
title('PID Controller')
legend('source level','PID')
%% error table
Title = {'steady state PID'};
Steady =[sserror1];
result = table(Steady,'RowNames',Title)