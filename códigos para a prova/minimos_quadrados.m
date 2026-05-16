clc
clear
close all

entrada = -5:0.1:5;
saida = (10 + (4.*entrada.^3) + (3.*entrada.^2) + (2 .*entrada));
saida = saida + randn(1,length(entrada))*10;
%usando série de taylor

x = entrada(:); %tranformando os dados em vetores coluna
y = saida(:);

A = [x.^0]; %funçao base constante
n = 3; %grau da série
for i = 1:n
  A=[A, x.^i]; %matriz de funçoes base
endfor

param = inv(A'*A)* A' * y; %vetor de parametros usando pseudoinversa
ym = A*param; %modelo

figure(1) %plot dos dados e do modelo
scatter(x,y,'b');
hold on
plot(x,ym,'r');

%usando série de Fourier
figure(2)

w = 10; %freq angular
%encontrar periodo de amostragem por frequencia de amostragem
fa = 100;
tamos = 2*pi/(fa*w);
T = (2*pi)/w;
entrada = 0:tamos:T*5;
saida = (2 + 4*sin(w*entrada*3) + 5*cos(w*entrada*4))+randn(1,length(entrada))*1;

%usando serie de fourier
x = entrada(:); %tranformando os dados em vetores coluna
y = saida(:);

A=[x.^0]; %funcao base constante

n=5; %grau da série
for i = 1:n
A=[A, sin(x.*w.*i),cos(x.*w.*i)];
endfor

param = inv(A'*A)* A' * y; %vetor de parametros usando pseudoinversa
ym=  A*param; %modelo

figure(2) %plot dos dados e do modelo
scatter(x,y,'b');
hold on
plot(x,ym,'r');
