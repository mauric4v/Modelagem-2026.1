clc;
clear;
close all;

load('mimo.mat');
%parametros de Z
Bz= [sum(x.^2),dot(x,y),dot(x.^2,y); %matriz B
     dot(x,y),sum(y.^2),dot(x,y.^2);
     dot(x.^2,y),dot(x,y.^2),dot(x.^2,y.^2)];

Vz= [dot(x,z);dot(y,z);sum(x.*y.*z)]; %matriz v

paramBz=inv(Bz)*Vz; %parametros de z
x_lin = linspace(min(x),max(x),100);
y_lin = linspace(min(y),max(y),100);
[X,Y] = meshgrid(x_lin, y_lin);;
z_est=paramBz(1,1)*X + paramBz(2,1)*Y+ paramBz(3,1).*X.*Y; % z estimado

figure(1)
scatter3(x,y,z); %scatter das amostras de z
hold
mesh(X,Y,z_est); %superficie estimada
%parametros de W
Bw= [sum(x.^2),dot(x,y),dot(x,y.^2); %matriz B
     dot(x,y),sum(y.^2),sum(y.^3);
     dot(x,y.^2),sum(y.^3),sum(y.^4)];

Vw= [dot(x,w);dot(y,w);dot(w,y.^2)]; %matriz v

paramBw=inv(Bw)*Vw; %parametros de w

w_est=paramBw(1,1)*X+paramBw(2,1)*Y+paramBw(3,1)*Y.^2; %w estimado

w_est_vetor=paramBw(1,1)*x+paramBw(2,1)*y+paramBw(3,1)*y.^2;
z_est_vetor=paramBz(1,1)*x + paramBz(2,1)*y+ paramBz(3,1).*x.*y;

figure(2)
scatter3(x,y,w);%scatter das amostras de w
hold
mesh(X,Y,w_est);%superficie estimada

for i=1:length(w_est_vetor) %erro do ruido
  erro_w(i)=w_est_vetor(i)-w(i);
  erro_z(i)=z_est_vetor(i)-z(i);
endfor

desviow=std(erro_w) %desvio padrao do ruido
desvioz=std(erro_z)

w_875=paramBw(1,1)*2.5+paramBw(2,1)*2.5+paramBw(3,1)*2.5 .^2
z_10=paramBz(1,1)*2.5 + paramBz(2,1)*2.5+ paramBz(3,1).*2.5 .*2.5


