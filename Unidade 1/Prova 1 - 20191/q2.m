clc;
clear;
close all;

load pkg control
f = [80 60 50 60 70];
Vp = [110 110 220 220 330];

for i = 1:length(f)
w=f(i)*2*pi;

fa = 100;
tamos= (2*pi)/(fa*w); %periodo de amostragem

T = 2*pi/w; %periodo
t = 0:tamos:T*5;
t = t(:);

x = Vp(i)*sin(w*t);
x = x(:);
%plot(t,x);

[V , I] = medidor_equip(x,tamos);

V=V(:);
I=I(:);

%%figure(1)
%%plot(t,x);
%%hold on;
%%scatter(t,V,'r');
%%hold on;
%%scatter(t,I,'b');

n=1;
A=[t.^0];

for i = 1:n
A=[A, sin(t.*w.*i),cos(t.*w.*i)];
endfor

paramV = inv(A'*A)* A' * V ;
ymv=  A*paramV;

paramI = inv(A'*A)* A' * I ;
ymi=  A*paramI;

%%figure(2)
%%plot(t,x);
%%hold on;
%%scatter(t,ymv,'r');
%%hold on;
%%plot(t,ymi,'b');

FV= atan2(paramV(3),paramV(2));
FI= atan2(paramI(3),paramI(2));
def= FV-FI;
FP(i)=cos(def)
endfor

