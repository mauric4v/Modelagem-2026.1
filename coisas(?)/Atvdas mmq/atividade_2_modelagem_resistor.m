clc;
clear;
close all;

load('dados_do_resistor(1).mat');

theta=sum(V .*I)/sum(V.^2);

R=1/theta * 1000 %resistor de 300 ohms

I_est = theta *V;

scatter(V,I,'r');
hold
plot(V,I_est);
