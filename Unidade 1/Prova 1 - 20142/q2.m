clc
clear
close all

pkg load control

tamos = 0.01;
t = 0:tamos:30;
u = 0:0.1:7;
uns = ones(1,length(t));
aux = motor(uns,tamos);
figure(1)
plot(t,motor(uns,tamos));
hold on
plot(t,motor(uns*(-4),tamos),'b');
for i = 1:length(u)
  i
  aux = motor(uns*u(i),tamos);
  w(i) = aux(end);
endfor

%usando série de taylor
x = u(:); %tranformando os dados em vetores coluna
y = w(:);
A = [x.^0]; %funçao base constante
n = 8; %grau da série
for i = 1:n
  A=[A, x.^i]; %matriz de funçoes base
endfor

param = inv(A'*A)* A' * y; %vetor de parametros usando pseudoinversa
ym = A*param; %modelo

figure(2) %plot dos dados e do modelo
scatter(x,y,'b');
hold on
plot(x,ym,'r');

% u = 6.3V no indice 64
w_63V = ym(63)

