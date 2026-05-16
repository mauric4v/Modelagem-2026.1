clc;
clear;
close all;
pkg load control

fa = 100;
w = logspace(-1, 6, 100);%0.1 a 100
ganho = zeros(1,100);
fase = zeros(1,100);
fase_deg = zeros(1,100);
t= zeros(1,5000);

Vp = 1; %aumenta o ganho pra diminuir o ruido

for i = 1:length(w)
    i
    tamos= (2*pi)/(fa*w(i)); %periodo de amostragem
    T = 2*pi/w(i); %periodo
    t = 0:tamos:T*20; %gera tantos periodos

    x = Vp*sin(w(i)*t); %entrada
    x = x(:);
    [y] = circuito(x,tamos);

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

semilogx(w, mdb)
grid on

eqm = (mdb-(-3)).^2; %encontra frequencia de corte
[aux idc] = min(eqm); %indice da frequencia
w0 = w(idc); %freq
%w0 = 1/RC
%R = 1/w0C
C = 33*10^(-9);
R = 1/(w0*C)
%4700
%vermelho
