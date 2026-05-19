clc
clear
close all

Ientrada = -100:0.1:100;
a = 1000;
amostras = [];
for i = 1:a
  i
  [Imedido] = amperimetro(Ientrada);
  amostras = [amostras;Imedido]; %matriz de amostras, onde cada linha é uma amostra diferente de Imedido para valores de tensao de -100 a 100
endfor

%podemos assim, extrair 1000 amostras de cada coluna da matriz (ex., a coluna 1 tem 1000 amostras da entrada de -100mA)
desvios = zeros(size(Ientrada));

for i = 1:length(Ientrada)
  desvios(i) = std(amostras(:,i)); %calcula o desvio correspondente a entrada, ou seja, o desvio padrao da coluna de amostras correspondente ao valor de corrente de entrada
  %o vetor desvio[] tera um valor de desvio padrao para cada valor de corrente
endfor

scatter(Ientrada,desvios); %a funcão é claramente uma parabola, pode ser modelada por série de taylor de grau 2

x = Ientrada(:); %tranformando os dados em vetores coluna
y = desvios(:);

A = [x.^0]; %funçao base constante
n = 2; %grau da série
for i = 1:n
  A=[A, x.^i]; %matriz de funçoes base
endfor

param = inv(A'*A)* A' * y; %vetor de parametros usando pseudoinversa
ym = A*param; %modelo

figure(1) %plot dos dados e do modelo
scatter(x,y,'b','+');
hold on
plot(x,ym,'r');

%a funcao é um polinomio de grau 2, com os parametros modelados
param(1)
param(2)
param(3)

%y = param(1) + param(2)*x + param(3)*x^2 , onde y é o desvio padrao e x a corrente em miliampere
