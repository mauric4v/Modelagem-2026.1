clc
clear
close all
load('neymar2014.mat');
load('neymar2026.mat');

figure(1)
subplot(211)
hold on
plot(t2014,u2014);
scatter(t2014,y2014);
subplot(212)
hold on
plot(t2026,u2026);
scatter(t2026,y2026);
 x14 = t2014(:); %tranformando os dados em vetores coluna
 x26 = t2026(:); %tranformando os dados em vetores coluna
 y14 = y2014(:);
 y26 = y2026(:);

 A14=[x14.^0,exp(x14.*-5)]; %matriz de funçoes base
 A26=[x26.^0,exp(x26.*-5)]; %matriz de funçoes base

 param14 = inv(A14'*A14)* A14' * y14; %vetor de parametros usando pseudoinversa
 param26 = inv(A26'*A26)* A26' * y26; %vetor de parametros usando pseudoinversa
 ym14 = (A14*param14); %modelo
 ym26 = (A26*param26); %modelo

 figure(2) %plot dos dados e do modelo
 subplot(211)
  hold on
  plot(x14,ym14);
  scatter(x14,y14);
  subplot(212)
  hold on
  plot(x26,ym26);
  scatter(x26,y26);

  %como para plotar, tivemos que escalar os dados dividinopelo parametro constante. pelo modelo, o param constante em 2014 = 9 em 2026 = 1
  ym14_novo =ym14;
  ym26_novo =ym26;
  figure(3)
  hold on
  plot(x14,ym14_novo);
  plot(x26,ym26_novo);

%o param constante é o que vai definir a velocidade final do motor, ja que o t=0, a velocidade é maxima,e pela fun de transferencia o ganho é 1 para entrada degrau
%logo, a velocidade final em 2014 é 9, e em 2026 é 1 (parametro constante em cada modelo);
