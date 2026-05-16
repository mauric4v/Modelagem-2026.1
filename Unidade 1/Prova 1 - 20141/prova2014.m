clc
clear
close all

load('P1_dados1.mat');

%plot(vetor_c);

##c_quad=vetor_c(1:8,1);
##c_circ=vetor_c(9:16,1);
##c_trig=vetor_c(17:24,1);
##c_reta=vetor_c(25:32,1);

y =  ones(32,1); %gerando vetor de saida
y(9:16,1)=2; %circulo
y(17:24,1)=3; %triangulo
y(25:32)=4; %reta

scatter(vetor_c,y,'b');
grid on
hold on

%taylor
A0=[vetor_c.^0];
nexp=5; %grau-1
for i = 1:nexp
  A0=[A0, vetor_c.^i];
endfor

param0 = inv(A0'*A0)* A0' * y;
ym0 = A0*param0;

scatter(vetor_c,ym0,'r');

%REPOSTA 1 = triangulo(3) 2 = circulo(2) 3 = reta(4) 4 =quadrado(1)
% 3 2 4 1

y_teste = zeros(1,4);
for i = 1:4
    for j = 0:nexp
      y_teste(1,i) += param0(j+1,1)*teste_c(i,1)^j; %joga a entrada no modelo
    end
    y_teste(1,i)= round(y_teste(1,i)); %arredondando pro inteiro
endfor
y_teste

