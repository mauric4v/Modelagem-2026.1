clc;
clear;
close all;

amostras = 10000;
Vr = 0;
centros = -3:0.05:3;
conts = zeros(size(centros));

%gerar histograma
for i = 1:amostras
  [Vm]=placa_de_aquisicao_3(Vr); %com Vr= 0, geramos apenas ruido
  [aux idc] = min((Vm-centros).^2);
  conts(idc) = conts(idc)+1;
endfor

prob = conts./amostras;

plot(centros,prob);
ideal = zeros(size(centros));

for i = 1:length(centros)
    if centros(i) > -0.5 & centros(i) < 0.5
      ideal(i) = 1/21;
    endif
end

hold on
plot(centros,ideal,'r');
EQM = mean((prob-ideal).^2)
%eqm1 = 1.8821e-04;
%eqm2 = 1.1822e-05;
%eqm3 = 2.1905e-05;
