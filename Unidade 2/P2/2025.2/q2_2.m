clc
clear
close all

th = [    4.9962 +   0.0000i;
   175.5472 + 399.6695i;
    -4.9907 +   7.6994i;
   175.5486 - 399.6643i;
    -4.9907 -   7.6994i ];
load('dados(1).mat');

%%A = [0 1;-84.3 -10]; %p/g(s)
%%B = [0 ; 84.3];
A = [0 1;0 -10]; %p/h(s)
B = [0 ; 10];
C = [1 0];
D = 0;

tamos = 0.01;
t = 0:tamos:2;
K=1/6;
u = K*5*ones(size(t));

X = [0 ; 0]; %condicao inicial
y_p = C*X + D*u(1);%saida do ponto medio

%inicio metodo do ponto medio
for k = 1:length(t)-1
  Fi_1 = A*X + B*u(k); %estimativa de inclinaçao inicial
  X_12 = X + Fi_1*tamos/2; %estimativa de k + 1/2
  Fi_p= A*X_12 + B*u(k); %estimativa de inclinacao do ponto medio

  X = X+Fi_p*tamos; %acha k+1
  y_p(k + 1) = C*X + D*u(k+1);
end

%scatter(t2,y2);
scatter(t,y);
hold on
plot(t, y_p,'r');
