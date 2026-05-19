clc
clear
close all

pkg load control

tamos = 0.01;
t = 0:tamos:30;
u = 0.1:0.1:7;
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
[~, idc] = min(y);
y(idc) = 0;
A = [x.^0]; %funçao base constante
n = 5; %grau da série
for i = 1:n
  A=[A, x.^-(i)]; %matriz de funçoes base
endfor

param = inv(A'*A)* A' * y; %vetor de parametros usando pseudoinversa
ym = A*param; %modelo

figure(2) %plot dos dados e do modelo
scatter(x,y,'b');
hold on
plot(x,ym,'r');

% u = 6.3V no indice 64
w_63V = ym(63)

x2 = (-7:0.1:7)';
%u2 = -7:0.1:-0.1;
%x2 =[u2 u]';
A = [x2.^0]; %funçao base constante
for i = 1:n
  A=[A, x2.^-(i)]; %matriz de funçoes base
endfor

ym = A*param; %modelo
%ym(71) = 0;
figure(3) %plot dos dados e do modelo
%scatter(x2,y,'b');
%hold on
%u2 = -7:0:-0.1;
for j = 1:length(x2)
  j
  aux = motor(uns*x2(j),tamos);
  w2(j) = aux(end);
endfor
scatter(x2',w2,'b');
hold on;
plot(x2,ym,'r');
ylim([0 23])
xlim([-7 7])

