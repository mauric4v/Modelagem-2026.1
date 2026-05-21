clc
clear
close all
n=100;
fa =70*n*10;
tamos = 1/fa;
TFINAL =(1/50)*10;
[V] = medidor(tamos,TFINAL);
t = 0:tamos:TFINAL;

plot(t,V);
%freq fundametal 65hz
x = t(:); %tranformando os dados em vetores coluna
y = V(:);

A=[]; %funcao base constante
freqs =[50,55,60,65,70];

for i = 1:length(freqs)
    A=[A, sin(x.*2*pi.*freqs(i)), cos(x.*2*pi.*freqs(i))];
endfor
A=[A x.^0];

param = inv(A'*A)* A' * y; %vetor de parametros usando pseudoinversa
ym= A*param; %modelo

figure(2) %plot dos dados e do modelo
%scatter(x,y,'b');
hold on
plot(x,ym,'r');

amp = freqs*0;

for i= 1:length(freqs)
  amp(i)=sqrt(param(2*i-1)^2 + param(2*i)^2);
endfor

%freq fun, 65hz
w = 2*pi*65;
A=[x.^0];

for i = 1:n
A=[A, sin(x.*w.*i),cos(x.*w.*i)];
endfor

param = inv(A'*A)* A' * y; %vetor de parametros usando pseudoinversa
ym=  A*param; %modelo

amp = zeros(1,n);

for i= 1:n
  amp(i)=sqrt(param(2*i)^2 + param(2*i+1)^2);
endfor

