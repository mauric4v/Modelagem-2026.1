clc;
clear;
close all;

function y = numeros_aleatorios(M,DP)
  y = DP*randn(1, 10000)+M;
endfunction
m=3;
dp=70;
y = numeros_aleatorios(m,dp);
ndivs=20;
larguradivs=(max(y)-min(y))/20;
freqs=zeros(1,ndivs);

caixas = min(y):larguradivs:max(y);
for i = 1:length(y)
   for j = 1:length(caixas)-1
     if y(i)>=caixas(j) && y(i) < caixas(j+1)
       freqs(j)+=1;
     endif
   endfor
  endfor

 media=mean(y)
 desvio=std(y)

 plot(freqs)
 hold
 plot(f)


