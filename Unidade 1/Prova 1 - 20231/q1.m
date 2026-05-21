clc
clear
close all

pkg load control

fa = 100; %freq de amostragem
res = 100; %resolucao do bode
w = logspace(-2, 2, res); %
ganho = zeros(1,res);
fase = zeros(1,res);
fase_deg = zeros(1,res);

Vp = 1; %ganho da entrada

%usando mmq para encontrar o ganho e fase de cada frequencia
for i = 1:length(w)
    i
    tamos= (2*pi)/(fa*w(i)); %periodo de amostragem
    T = 2*pi/w(i); %periodo
    t = 0:tamos:T*100; %gera tantos periodos
    t = t(:); %vetor coluna

    x = Vp*sin(w(i)*t);
    x = x(:);
    y = sistema_dinamico(x,tamos); %saida
    y = y(:);

    %usando serie de fourier

    A=[t.^0]; %funcao de base constante
    n=1; %grau da serie
    for k = 1:n
    A=[A, sin(t.*w(i).*k),cos(t.*w(i).*k)]; %gera matriz de funcoes de base
    endfor

    param = inv(A'*A)* A' * y; %vetor de parametros
    ym =  A*param; %modelo

    %ganho(i) = ( max(abs(ym)) )/(max(abs(x))); %ganhos para cada w
    ganho(i) = sqrt( param(3,1).^2 + param(2,1).^2 ); %ganhos para cada w

    fase(i)=atan2(param(3,1),param(2,1)); %fase pra cada w
    fase_deg(i) = rad2deg(fase(i)); %transforma em graus
end

mdb = 20*log10(ganho); %calculo em db

semilogx(w, mdb) %plot de ganho
grid on;

