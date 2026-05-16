clc;
clear;
close all;

t1 = [0:0.01:3]; %0 a 3 sec amsotrando em 0.1

u = ones(size(t1)); %u(t)
h = 2*exp(-4*t1);
aprox= zeros(size(t1)); %vetor resultado

for j = 1:length(t1) %pra cada tempo tal
  for k = 1:j %ate o tempo tal
    aprox(j) += h(k)*0.01; %area abaixo da curva
  endfor
endfor

t2 = [0:0.001:3];
y = (-exp(-4*t2)+1)/2;

figure(1)
subplot(2,1,1)
plot(t1,aprox,'b')
title('aprox em azul e y(t) em vermelho')
hold
plot(t2,y,'r')


