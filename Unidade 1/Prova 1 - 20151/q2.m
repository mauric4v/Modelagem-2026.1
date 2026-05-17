clc
clear
close all

a = 10000;
varA=0.01;
varB=0.1;

%%fA=( 1/(sqrt(2*pi*(varA))) ).*exp( ((0+0).^2)/2*varA);
%%fb=( 1/(sqrt(2*pi*(varB))) ).*exp( ((0+0).^2)/2*varA);

centros = -1:0.01:1;
conts = zeros(size(centros));
soma_media = 0;
%gerar histograma
for i = 1:a
  [Vmedido] = voltimetro4(0);
  soma_media += Vmedido;
  [aux idc] = min((Vmedido-centros).^2);
  conts(idc) += 1;
endfor

prob = conts./a;

media = abs(soma_media/a)

figure(1)
plot(centros,prob);


fA=( 1/(sqrt(2*pi*(varA))) ).*exp( -( (centros.^2 + 0)./(2*varA)) );
fB=( 1/(sqrt(2*pi*(varB))) ).*exp( -( (centros.^2 + 0)./(2*varB)) );
Fa = fA.*0.01;
Fb = fB.*0.01;
hold on
plot(centros,Fa,'r');
hold on
plot(centros,Fb,'m');

eqmA = mean((prob-Fa).^2)
eqmB = mean((prob-Fb).^2)

if media > 0.1
  disp('DESCARTADO!!!');
  elseif eqmA < eqmB
  disp('CLASSE A');
    else
  disp('CLASSE B');
end

%v1 = Classe A .
%v2 = descartado
%v3 = Classe B
%v4 = Classe B
%v5 = descartado

