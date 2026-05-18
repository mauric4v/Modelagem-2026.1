clc
clear
close all

tamos = 0.0001;
periodos = 5;
T = 0.005;
pulso = [10*ones(1, (0.004/tamos)), zeros(1, 0.001/tamos)]; %gera um periodo da onda
sinal=[];

for i = 1:periodos %quantidade de periodos
  sinal = [sinal pulso]; %concatena os periodos para gerar o sinal
endfor

t = -0.002 : tamos : -0.002 + (T*periodos) -tamos; %sinal de tempo corespondente a onda (remove um extremo, ja que o pulso tambem nao tem)
%como pulso foi montado a partir da borda de subida, o periodo comeca 0.002 ms antes de 0, por isso o sinal de tempo está deslocado
%por -0.002, para que o sinal fique com a fase mostrada na figura.

[~,idc0] = min(abs(t)); %encontra o 0 no tempo
t = t (idc0:end); %corta a parte negativa
sinal = sinal(idc0:end);

figure(1)
plot(t,sinal);

x = t(:); %tranformando os dados em vetores coluna
y = sinal(:);
w = (2*pi)/0.005;
A=[x.^0]; %funcao base constante

n=20; %grau da série
for i = 1:n
A=[A, sin(x.*w.*i),cos(x.*w.*i)];
endfor

param = inv(A'*A)* A' * y; %vetor de parametros usando pseudoinversa
ym=  A*param; %modelo

figure(2) %plot dos dados e do modelo
scatter(x,y,'b');
hold on
plot(x,ym,'r');

teste_sinal1 = sinal(1:T/tamos)'; %pega o primeiro periodo do sinal
teste_modelo1 = ym(1:T/tamos);

teste_sinal2 = sinal(1+(T/tamos):(T*2)/tamos)'; %pega o segundo periodo do sinal
teste_modelo2 = ym(1+(T/tamos):(T*2)/tamos);

%eqm comparando os periodos do modelo e do sinal
eqm1 = mean((teste_sinal1-teste_modelo1).^2);
eqm2 = mean((teste_sinal2-teste_modelo2).^2);

if int32(eqm1*10000) == int32(eqm2*10000) %fodase
  disp('em um periodo, a eqm entre o sinal e serie é fixa')
  eqm = eqm1
else
  disp('falso')
endif


