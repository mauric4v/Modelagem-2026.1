clc;
clear;
close all;

pkg load control;

w = (logspace(-1,2,100))'; %vetor de freqs

for i = 1:length(w) %para cada frequencia
   i
   tamos = 2*pi/(w(i)*100); %periodo de amostragem
   T = 2*pi/(w(i)); %periodo
   t = (0:tamos:T*20)'; %gera sempre 5 periodos

   U = 5*sin(w(i)*t); %sinal de entrada
  [W] = motor_do_jogador(U,tamos); %saida

  A=[t.^0]; %sinal de 1
  n =1; %grau da serie

  %mmq usando serie de fourier
  for j = 1:n
  A=[A, sin(w(i)*t*n),cos(w(i)*t*n)];
  endfor

  param = inv(A'*A)* A' * W;
  y = A*param;

  ganho(i)= max(abs(y))/max(abs(U));
endfor

mdb = 20.*log10(ganho);
figure(1)
semilogx(w,mdb);
grid on;
%g0 = 12.06 db
%10% = g0 - 20db
