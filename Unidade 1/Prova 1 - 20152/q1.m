clc
clear
close all

pkg load control
fa = 200; %freq de amostragem
w = 2*pi*60;
Vp = 220; %ganho da entrada

%usando mmq para encontrar o ganho e fase de cada frequencia
for i= 0:3
    tamos= (2*pi)/(fa*w); %periodo de amostragem
    T = 2*pi/w; %periodo
    t = 0:tamos:T*5; %gera tantos periodos
    t = t(:); %vetor coluna

    x = Vp*sin(w*t);
    x = x';
    [Vy,Iy] = medidor(x,tamos,i); %saida
    Vy = Vy(:);
    Iy = Iy(:);

    %usando serie de fourier

    A=[t.^0]; %funcao de base constante
    n=1; %grau da serie
    for k = 1:n
    A=[A, sin(t.*w.*k),cos(t.*w.*k)]; %gera matriz de funcoes de base
    endfor

    paramV = inv(A'*A)* A' * Vy;
    paramI = inv(A'*A)* A' * Iy; %vetor de parametros
    ymV =  A*paramV;
    ymI =  A*paramI; %modelo

    %ganho(i) = ( max(abs(ym)) )/(max(abs(x))); %ganhos para cada w
    %ganho(i) = sqrt( param(3,1).^2 + param(2,1).^2 ); %ganhos para cada w

    faseV=atan2(paramV(3,1),paramV(2,1));
    faseI=atan2(paramI(3,1),paramI(2,1));
    Fps(i+1) = cos(faseV-faseI);
end
FP_da_rede = Fps(1)
%precia de correcao
bancos_com_correcoes_certas = find(Fps>0.92)-1
[~,idc] = max(Fps);
banco_recomendado = idc-1
