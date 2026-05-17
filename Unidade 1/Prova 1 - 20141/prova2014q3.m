clc
clear
close all
pkg load control

fa = 100;
w = logspace(-1, 2, 100);%0.1 a 100
ganho = zeros(1,100);
fase = zeros(1,100);
fase_deg = zeros(1,100);
t = zeros(1,5000);

Vp = 10; %aumenta o ganho pra diminuir o ruido

for i = 1:length(w)
    i
    tamos= (2*pi)/(fa*w(i)); %periodo de amostragem
    T = 2*pi/w(i); %periodo
    t = 0:tamos:T*20; %gera tantos periodos

    x = Vp*sin(w(i)*t); %entrada
    x = x(:);
    y = filtro(x,tamos);

    %modelagem pra cada w
    n=1;
    A=[t'.^0];

    for k = 1:n
    A=[A, sin(t'.*w(i).*k),cos(t'.*w(i).*k)];
    endfor

    param = inv(A'*A)* A' * y;
    ym=  A*param;

    ganho(i) = ( max(abs(ym)) )/(max(abs(x))); %ganhos para cada w

    fase(i)=atan2(param(3,1),param(2,1)); %fase pra cada w
    fase_deg(i) = rad2deg(fase(i));
end

mdb = 20*log10(ganho);

subplot (211)
semilogx(w, mdb)
grid on;
subplot(212)
semilogx(w,fase_deg,'r');
grid on;
%mdb = -3 nos indices 47 e 48, w0 ~= 2.3 ou 2.4

%com mais amostras fica exatamanete 2.4
%filtro de primeira ordem, ganho quase de -20db após 1decada

%H(s)= 2,4/(s+2,4)
