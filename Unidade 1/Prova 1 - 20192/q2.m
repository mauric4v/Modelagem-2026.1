clc
clear
close all

Vteste = -8:0.1:8;
a = 1000;
Vmedido=[];
for i = 1:length(Vteste)
  i
  for j = 1:a
  Vmedido(j,i)= voltimetro2(Vteste(i));
  endfor
endfor

for i = 1:length(Vteste)
desvios(i) = std(Vmedido(:,i));
endfor

stem(Vteste,desvios);
%apenas o Voltimetro 1 nao é aditivo

centros = -3:0.01:3; %variavel aleatoria
conts = zeros(size(centros)); %contagem de valores da variavel aleatoria
a = 10000; %numero de amostras
soma_media = 0;

for i = 1:a
  ruido = voltimetro2(0);
  soma_media += ruido;
  [~, idc] = min((ruido-centros).^2); %eqm para descobrir onde a variavel aleatoria caiu
  conts(idc) += 1; #conta onde caiu
endfor
 %vetor de probabilidades

pdfV = conts./(sum(conts)*0.01);

area = sum(pdfV*0.01);
media = mean(ruido);
varV = (std(ruido)).^2;
varA = 0.1
fA=( 1/(sqrt(2*pi*(varA))) ).*exp( -( ((centros - 0).^2) ./(2*varA)) );
area2 = sum(fA*0.01);

%fR=( 1/(sqrt(2*pi*(varV))) ).*exp( -( ((centros - media).^2) ./(2*varV)) );

figure(2)
hold on
plot(centros,fA,'r');
plot(centros,pdfV,'b');
eqmA = mean((fA-fR).^2)

%eqm do voltimetro 2=4.6329e-07
%eqm do voltimetro 3 = 6.9777e-06
%o melhor é o voltimetro
