clc
clear
close all
th=[   1.1282 -  0.0000i;
    0.4281 +  0.0001i;
  -11.2285 +  0.0020i;
   -1.5512 -  0.0001i;
   -2.8477 -  0.0001i ]

load ('sistemacontrolado.mat');

A = [0 1;-7.2 -2]; %p/g(s) = k/s
B = [0 ; 7.2];
C = [1 0];
D = 0;

tamos = 0.01;
t = 0:tamos:5;
u = 5*ones(size(t));

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
