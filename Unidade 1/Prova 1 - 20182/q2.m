clc
clear
close all

tamos = 0.0001;
T = 0.005;

pulso = [10*ones(1, 40), zeros(1, 10)];
sinal=[];
for i = 1:5 %quantidade de periodos
  sinal = [sinal pulso];
endfor

t = -0.002 : tamos : -0.002 + (length(sinal) - 1) * tamos;
t = t (21:end);
sinal = sinal(21:end);
plot(t,sinal);

x = t(:); %tranformando os dados em vetores coluna
y = sinal(:);
w = (2*pi)/0.005;
A=[x.^0]; %funcao base constante

n=20; %grau da série
for i = 1:n
A=[A, sin(x.*w.*i),cos(x.*w.*i)];
endfor

param = inv(A'*A)* A' * y; %vetor de parametros usando pseudoinversa
ym=  A*param; %modelo

figure(2) %plot dos dados e do modelo
scatter(x,y,'b');
hold on
plot(x,ym,'r');

teste_sinal = sinal(1:T/tamos)';
teste_modelo = ym(1:T/tamos);

eqm = mean(abs(teste_sinal-teste_modelo))



