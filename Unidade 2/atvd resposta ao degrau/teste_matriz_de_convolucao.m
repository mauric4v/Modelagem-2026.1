clc
clear
close all
load('resposta_ao_degrau.mat');

t1 = t1'; %vetor de tempo
t2 = 0:0.01:1;
dt = (t1(2)-t1(1)); %dt

ht1 = 3.5*exp(-3.5.*t2'); %sistema h(t)

n = length(ht1); %n de colunas
m = length(t1); %n de linhas
ut1 = ones(size(t1)); %entrada u(t)

Ut1 = zeros(m,n);%matriz de convolucao

%montar a matriz de convolucao
for i=1:n %para cada coluna
 Ut1(i:m,i) = ut1(1:end-i+1);
endfor

%conv
yt1 = Ut1*ht1*dt;
plot(t1,yt1,'linewidth',2,'r')
hold on
scatter(t1,y1')


