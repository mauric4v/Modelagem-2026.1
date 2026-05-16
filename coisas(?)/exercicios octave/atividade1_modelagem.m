clear;
close all;
clc;

 Mx0=0; %x
 My0=0; %y
 sigmax=1; %desvio padrao
 sigmay=1; %desvio padrao
 A = 1; %amplitude

 [Mx, My] = meshgrid(-10:0.1:10);

 Mz = A*exp(-( ((Mx-Mx0).^2)/2*sigmax.^2 + ((My-My0).^2)/2*sigmay.^2) );

 mesh(Mx,My,Mz)






