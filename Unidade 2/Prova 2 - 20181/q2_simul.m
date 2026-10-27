clc
clear
close all
load('resp_deg_3a.mat')

A = [0 1 0; 0 0 1;-145.4 -66.14 -9.445]; %p/dados 1
B = [0; 0; 145.4];
C = [1 0 0];
D = 0;

tamos = 0.005;
%t = 0:tamos:4;
t = 0:tamos:3;
t = t(:)
%u = ones(size(t));
u = 10*sin(16*2*pi*t);;

X = [0 ; 0 ; 0]; %condicao inicial
y_rg4 = C*X + D*u(1);%saida do range lutta

%inicio metodo range kutta 4 ordem
for k = 1:length(t)-1
  F1 = A*X + B*u(k); %estimativa F1
  X2 = X + F1*tamos/2; %estimativa de k + 1/2
  F2= A*X2 + B*u(k); %estimativa de inclinacao do k+1/2

  X3 = X + F2*tamos/2; %acha k+1/2 denovo
  F3 = A*X3 + B*u(k);

  X4 = X + F3*tamos;
  F4 = A*X4 + B*u(k+1);
  X = X + tamos*(F1+(2*F2)+(2*F3)+F4)*(1/6); %inclinacao final
  y_rg4(k + 1) = C*X + D*u(k+1);
end

%scatter(t2,y2);
%scatter(t,y);
hold on
plot(t, y_rg4,'r','linewidth',2);
