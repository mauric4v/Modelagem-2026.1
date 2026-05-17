clc
clear
close all

temp = 20:0.1:60;
u = 10:0.01:20;
%a resistencia numa temperatura k será o inverso do parametro de inclinaçao
res = zeros(1,length(temp));

for i =1:length(temp)
  x = u(:); %tranformando os dados em vetores coluna
  [saida] = resistor(x,temp(i));
  y = saida(:);

  A = [x.^0]; %funçao base constante
  n = 1; %grau da série
  for j = 1:n
    A=[A, x.^j]; %matriz de funçoes base
  endfor

param = inv(A'*A)* A' * y; %vetor de parametros usando pseudoinversa
ym = A*param; %modelo

res(i) = 1/param(2);
endfor

x = temp(:); %tranformando os dados em vetores coluna
y = res(:);

A = [x.^0]; %funçao base constante
n = 3; %grau da série
for i = 1:n
  A=[A, x.^i]; %matriz de funçoes base
endfor

param = inv(A'*A)* A' * y; %vetor de parametros usando pseudoinversa
ym = A*param; %modelo

figure(2) %plot dos dados e do modelo
scatter(x,y,'b','*');
hold on;
plot(x,ym,'k');
hold on;
%indice de temp = 251
idc = find(x==45)
resistencia45_1 = ym(idc)


%usando a media

res2 = zeros(1,length(temp));

for i =1:length(temp)
  x = u(:); %tranformando os dados em vetores coluna
  [saida] = resistor(x,temp(i));
  y = saida(:);

  res2(i) = mean(x./y);
endfor

x = temp(:); %tranformando os dados em vetores coluna
y = res2(:);

A = [x.^0]; %funçao base constante
n = 3; %grau da série
for i = 1:n
  A=[A, x.^i]; %matriz de funçoes base
endfor

param = inv(A'*A)* A' * y; %vetor de parametros usando pseudoinversa
ym = A*param; %modelo
 %plot dos dados e do modelo
scatter(x,y,'r','d');
hold on;
plot(x,ym,'m');
hold on;
%indice de temp = 251

resistencia45_2 = ym(idc)







