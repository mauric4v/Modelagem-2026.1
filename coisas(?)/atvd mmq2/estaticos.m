clc
clear
close all

load ('dados_estaticos.mat');

plot(x0,y0)
%usando uma equacao de segundo grau como param
%x^2, x e 1

A=[x0.^2;x0;ones(size(x0'))];

y0 = y0'
param0 = inv(A'*A)* A' * y0;
