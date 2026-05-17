clc
clear
close all

%gerar histograma
centros = 1:1:20; %variavel aleatoria
conts = zeros(size(centros)); %contagem de valores da variavel aleatoria
a = 10000; %numero de amostras
soma_media = 0;

for i = 1:a
  R = dado_d20;
  [~, idc] = min((R-centros).^2); %eqm para descobrir onde a variavel aleatoria caiu
  conts(idc) += 1; #conta onde caiu
endfor
prob = conts./a; %vetor de probabilidades

bar(centros,prob);
hold on;
ideal = (1/20)*ones(size(centros));

hold on
plot(centros,ideal,'r');

eqm = mean(abs(ideal-prob))

if eqm > 10^-6
  disp('VICIADO!!')
else
  disp('NAO VICIADO!!')
end

prob_1e20 = ( prob(1) * prob(20) )*100
