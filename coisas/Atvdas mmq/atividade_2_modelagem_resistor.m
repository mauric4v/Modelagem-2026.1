clc;
clear;
close all;

load('dados_do_resistor(1).mat');

R=0.33;

I_est =  (V./R);

scatter(V,I,'r');
hold
plot(V,I_est);

erro=I_est-I;

figure()
plot(erro);

%gerar histograma
centros = -10:0.1:10; %variavel aleatoria
conts = zeros(size(centros)); %contagem de valores da variavel aleatoria
a = length(I); %numero de amostras
soma_media = 0;
ruido = I-I_est;
dp=std(ruido);
for i = 1:a
  soma_media += ruido(i);
  [~, idc] = min((ruido(i)-centros).^2); %eqm para descobrir onde a variavel aleatoria caiu
  conts(idc) += 1; #conta onde caiu
endfor
#prob = conts./(sum(conts).*0.1);
media = abs(soma_media/a);

vari = dp.^2;
pdf=( 1/(sqrt(2*pi*(vari))) ).*exp( (-(centros-media).^2)/2*vari);
figure()
#plot(centros,prob);
hold
plot(centros,pdf);
