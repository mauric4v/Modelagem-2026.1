clc
clear
close all

fa = 200; %freq de amostragem
res = 100; %resolucao do bode
w = logspace(-1, 6, res); %
ganho1 = zeros(1,res);
ganho2 = zeros(1,res);
ganho3 = zeros(1,res);
fase = zeros(1,res);
fase_deg = zeros(1,res);

Vp = 1; %ganho da entrada

%usando mmq para encontrar o ganho e fase de cada frequencia
for i = 1:length(w)
    i
    tamos= (2*pi)/(fa*w(i)); %periodo de amostragem
    T = 2*pi/w(i); %periodo
    t = 0:tamos:T*20; %gera tantos periodos
    t = t(:); %vetor coluna

    x = Vp*sin(w(i)*t);
    x = x(:);

    y1 = filtro1(x,tamos); %saida
    y2 = filtro2(x,tamos);
    y3 = filtro3(x,tamos);
    y1 = y1(:);
    y2 = y2(:);
    y3 = y3(:);

    %usando serie de fourier

    A=[t.^0]; %funcao de base constante
    n=1; %grau da serie
    for k = 1:n
    A=[A, sin(t.*w(i).*k),cos(t.*w(i).*k)]; %gera matriz de funcoes de base
    endfor

    param1 = inv(A'*A)* A' * y1; %vetor de parametros
    ym1 =  A*param1; %modelo
    ganho1(i) = ( max(abs(ym1)) )/(max(abs(x))); %ganhos para cada w

    param2 = inv(A'*A)* A' * y2; %vetor de parametros
    ym2 =  A*param2; %modelo
    ganho2(i) = ( max(abs(ym2)) )/(max(abs(x))); %ganhos para cada w

    param3 = inv(A'*A)* A' * y3; %vetor de parametros
    ym3 =  A*param3; %modelo
    ganho3(i) = ( max(abs(ym3)) )/(max(abs(x))); %ganhos para cada w

end
mdb1 = 20*log10(ganho1); %calculo em db
mdb2 = 20*log10(ganho2); %calculo em db
mdb3 = 20*log10(ganho3); %calculo em db

subplot (311)
semilogx(w, mdb1) %plot de ganho
title('filtro1')
grid on;
subplot (312)
semilogx(w, mdb2) %plot de ganho
title('filtro2')
grid on;
subplot (313)
semilogx(w, mdb3) %plot de ganho
title('filtro3')
grid on;

%%atenuacao1 = -3.2176
%%atenuacao2 = -39.229
%%atenuacao3 = -13.816

#mesmo que o segundo tenha uma atenuacao menor, ele é um passa baixa, e a questao pede o que mude menos as outras frequencias.
#o filtro 3 é um rejeita faixa que atenua a de 60hz, entao ele é o escolhido, com uma atenuacao de -13db, ou ganho de 0.2


