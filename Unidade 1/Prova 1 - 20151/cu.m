clc
clear
close all
pkg load control

fa = 100;
w = logspace(-2,3,1000);

Vp=10000;
for j = 1:length(w)
j
tamos = (2*pi)/(w(j)*fa);
T = (2*pi)/w(j);
t = 0:tamos:T*5;
%w = 2*pi*0.001;
u = Vp*sin(w(j)*t);
[y] = motor_do_jogador(u,tamos);

%usando serie de fourier
x = t(:); %tranformando os dados em vetores coluna
y = y(:);

A=[x.^0]; %funcao base constante

n=1; %grau da série
%for i = 1:n
A=[A, sin(x.*w(j)),cos(x.*w(j))];
%endfor

param = inv(A'*A)* A' * y; %vetor de parametros usando pseudoinversa
ym=  A*param; %modelo

ganho(j) = (sqrt(param(3)^2+param(2)^2))/Vp;
end
mdb = 20*log10(ganho);
semilogx(w,mdb);
grid on;
