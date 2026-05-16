clc;
clear;
close all;

amostras = 10000;
Vr = 0;
centros = -10:0.05:10;
conts = zeros(size(centros));

%gerar histograma
for i = 1:amostras
  [Vm]=placa_de_aquisicao_1(Vr); %com Vr= 0, geramos apenas ruido
  [aux idc] = min(abs(Vm-centros));
  conts(idc) = conts(idc)+1;
endfor

prob = conts./amostras;

plot(centros,prob);


hold on
plot(centros,prob_ideal,'r');
eqm = mean((prob-prob_ideal).^2)
%eqm1 = 5.4728e-05;
%eqm1 = 2.9572e-06;
%eqm1 = 2.1905e-05;
