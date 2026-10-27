clc
clear
close all
load one_hel.mat;

A = [0 1;-20.51 -1.2]; %p/Y(s)
B = [0 ; 13.94];
C = [1 0];
D = 0;

tamos = 0.01;
t = 0:tamos:6;
t = t(:);
u = 1*ones(size(t)); %testando com 2 v

X = [0;0]; %condicao inicial
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
Saida_Ys= y_rg4;

%%scatter(t2,y2);
%%hold on
%%plot(t, y_rg4,'r');


A = [-1.02 -20.51;1 0]; %p/W(s)
B = [13.94 ; 0];
C = [1 0];
D = 0;


X = [0;0]; %condicao inicial
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
Saida_Ws=y_rg4;

plot(t,Saida_Ys,'r','linewidth',2);
hold on
plot(t,Saida_Ws,'k');
hold on
scatter(t2,y2);

posicao_1segundo = Saida_Ys(101)
velocidade_1segundo = Saida_Ws(101)
