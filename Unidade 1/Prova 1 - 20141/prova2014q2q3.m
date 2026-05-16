clc
clear
close all

pkg load control

w = 1;
Vp= 1;
tamos= (2*pi)/(200*w); %periodo de amostragem
t = 0:tamos:20;

x = Vp*sin(w*t);
x = x(:);
y = filtro(x,tamos);

plot(t,x);
hold on
plot(t,y,'r');

n=1;
A=[t'.^0];

for i = 1:n
A=[A, sin(t'.*w.*i),cos(t'.*w.*i)];
endfor

param = inv(A'*A)* A' * y;
ym=  A*param;

hold on
plot(t,ym,'g');

ganho = ( max(abs(ym)) )/(max(abs(x)))
ganho = sqrt( (param(3,1).^2) + (param(2,1).^2) )

fase=atan2(param(3,1),param(2,1))
fase_deg = rad2deg(fase)

% p / w = 0.1 -> ganho ~= 1
% p / w = 1 -> ganho ~= 0.9
% p / w = 10 -> ganho ~= 0.2
 %passa baixa, conforme aumentei w o ganho diminuiu

