clc
clear
close all

th=[5.6334;
    4.1956;
   -0.5521;
   -0.3007;
    0.9142;
    0.6606;
    6.0834;
   -4.5257;
   -0.6810;
   -0.6703;
    1.2443;
    1.2542;
   10.4953 ]

x1 = [10;8;10]; %ka
x2 = [8;8;8];%kb
x3 = [1.43;1.54;0.5];%ta
x4 = [0.38;1.42;1.42];%tb
n = 3; %grau da função

ym = th(1);
for i=1:n-1
  ym = ym + th((6*i)-4)*tanh(x1.*th((6*i)-3) + x2.*th((6*i)-2)+ x3.*th((6*i)-1)+ x4.*th(6*i)+  th((6*i)+1));
endfor

respostas = round(ym)
%propano,butano, metano

