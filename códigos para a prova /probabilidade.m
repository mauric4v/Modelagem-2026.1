clc
clear
close all

%desvio padrão é a raiz quadrada da variancia
%dp = 2 -> var = sqrt(2) ;  var = 2 -> dp = 2^2

%gerar histograma
centros = -1:0.01:1; %variavel aleatoria
conts = zeros(size(centros)); %contagem de valores da variavel aleatoria
a = 1000; %numero de amostras
soma_media = 0;

for i = 1:a
  ruido = sqrt(0.1)*randn();
  soma_media += ruido;
  [~, idc] = min((ruido-centros).^2); %eqm para descobrir onde a variavel aleatoria caiu
  conts(idc) += 1; #conta onde caiu
endfor
prob = conts./a; %vetor de probabilidades
media = abs(soma_media/a);

figure(1)
plot(centros,prob);

%se a questao der uma funcao pdf, para plotar junto, tem q dividir o resultado da pdf pelo tamanho de delta x,nessa caso,é 0.1
%distribuicao uniforme, a mesma probabilidade em todas as ocorrencias
