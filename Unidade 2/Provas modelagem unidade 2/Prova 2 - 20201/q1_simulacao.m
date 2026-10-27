clc
clear
close all

A = [-0.3-0.5]; %p/dados 1
B = [0.1];
C = [1];
D = [0];

tamos = 0.01;
t = 0:tamos:30;
t = t(:);
u = 50*ones(size(t));
P=50;
[I] = filtro_ajustavel(u,P,tamos);

X = [0]; %condicao inicial
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

scatter(t,I);
hold on
plot(t,y_rg4,'r','linewidth',4);
