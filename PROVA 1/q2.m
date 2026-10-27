clc
clear
close all

pkg load control

fa = 100; %freq de amostragem
res = 100; %resolucao do bode
w = logspace(-1, 7, res); %vetor de frequencias em rad por segundo
ganho = zeros(1,res);
fase = zeros(1,res);
fase_deg = zeros(1,res);

Vp = 1; %ganho da entrada (max de 1v em modulo)

%usando mmq para encontrar o ganho e fase de cada frequencia
for i = 1:length(w)
    i
    tamos= (2*pi)/(fa*w(i)); %periodo de amostragem
    T = 2*pi/w(i); %periodo
    t = 0:tamos:T*50; %gera tantos periodos
    t = t(:); %vetor coluna

    x = Vp*sin(w(i)*t);
    x = x(:);
    [y] = sistema(x,tamos); %saida
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
    ganho(i) = ganho(i)./Vp; %divide ponto a ponto
    fase(i)=atan2(param(3,1),param(2,1)); %fase pra cada w
    fase_deg(i) = rad2deg(fase(i)); %transforma em graus
end

mdb = 20*log10(ganho); %calculo em db
figure(1)
semilogx(w, mdb) %plot de ganho
grid on;

%ganho(0) ~= 2 %ganho constante (vi no editor de variveis)
%mdb(0) = 6


%para encontrar o ruido, vamos botar uma entrada em que sei que o ganho é constante, como uma senoide de 1 rads, e ja que é aditivo, extrair o ruido fazendo R = (Vmedido/ganho(0))+fase(0) - Vreal
w = 1
tamos= (2*pi)/(fa*w); %periodo de amostragem
T = 2*pi/w; %periodo
t = 0:tamos:T*10; %gera tantos periodos
t = t(:); %vetor coluna

    Vreal = Vp*sin(w*t);
    x = Vreal(:);
    [y] = sistema(x,tamos); %saida
    y = y(:);

    Vmedido_proporcional = y./2; %ganho em 1 rads é 2
    Vmedido_proporcional = Vmedido_proporcional - (0.01);

    figure(2)
    hold on
    plot(t,Vreal);
    scatter(t,Vmedido_proporcional);

R = Vmedido_proporcional - Vreal;

%para obter a pdf gaussiana, precisamos da media e da variancia
var_R = std(R).^2

centros = -1:0.01:1; %variavel aleatoria
conts = zeros(size(centros)); %contagem de valores da variavel aleatoria
soma_media = 0;

for i = 1:length(R)
  ruido = R(i);
  soma_media += ruido;
  [~, idc] = min((ruido-centros).^2); %eqm para descobrir onde a variavel aleatoria caiu
  conts(idc) += 1; #conta onde caiu
endfor
 %vetor de probabilidades
media = abs(soma_media/length(R))
pdfR = conts./(sum(conts)*0.01); %pdf do ruido
figure(3);
plot(centros,pdfR);

%os parametros necessarios sao a media, que é igual a 0.8, e a variancia,que é igual a 0.015
%para verificar se as pdfs batem:
pdf_est=( 1/(sqrt(2*pi*(var_R))) ).*exp( -( ((centros - media).^2) ./(2*var_R)) );
hold on
plot(centros,pdf_est);




