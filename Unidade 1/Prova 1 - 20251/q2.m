clc;
clear;
close all;

load('respdeg.mat');

x = 2*ones(size(t));
figure(1)
plot(t,x,'r');
hold on
scatter(t,y);

 x = t(:); %tranformando os dados em vetores coluna
 y = y(:);

 A=[x.^0, exp(-x)]; %matriz de funçoes base

 param = inv(A'*A)* A' * y; %vetor de parametros usando pseudoinversa
 ym = A*param; %modelo

 figure(2) %plot dos dados e do modelo
 scatter(x,y,'b');
 hold on
 plot(x,ym,'r');

 %encontrar A e B
 AeAB = inv([0,2;2,-2]) * param;

 A = AeAB(1)
 B = AeAB(2)/A
