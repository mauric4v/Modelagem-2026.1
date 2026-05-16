clc
clear
close all

pkg load control;

%s=1j.*w;
s=tf('s');
H=2/(s + 2);

w = 20;
tfinal = 25;
tamos = 0.01;
t=0:tamos:tfinal;
A=1;
x= A*sin(w.*t);

y=lsim(H,x,t);

plot(t,x,'b');
hold on
plot(t,y,'r');
