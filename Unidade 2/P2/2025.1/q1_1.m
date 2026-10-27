clc
clear
close all

load ('sistemacontrolado.mat');
t=0:0.01:5;
x=t(:);
y=y(:);
n = 3; %grau da função
th = zeros((n*2)-1, 1) + 1j*zeros((n*2)-1, 1); %vetor de parametros
%chutes
th(1) = (rand()*0.5 - 0.25) + 1j*(rand()*0.5 - 0.25);%%th grau 3=[   5.6334;

for i = 1:n-1
    th(2*i) = (rand()*0.5 - 0.25) + 1j*(rand()*0.5 - 0.25);
    th((2*i)+1) = (rand()*0.5 - 0.25) + 1j*(rand()*0.5 - 0.25);
end
alfa = 0.1; %amortecimento
Dmax = 0.8; %valor de saturacao

%criando o modelo
ym = th(1);
for i=1:n-1
  ym = ym + th(2*i)*exp(th((2*i)+1).*x);
endfor

%figura para plotar
figure(1)
scatter(x,y);
hold on
h = plot(x,ym,'r');
crit = 1
cont=0
lambda = 1e-3;

while crit == 1
cont=cont+1
dy = y-ym; %erro dy

%criando o jacobiano
J = x.^0;
for i = 1:n-1
J = [J exp(th((2*i)+1).*x) x.*th(2*i).*exp(th((2*i)+1).*x)]; %derivadas das exponenciais
endfor

dth = inv(J'*J + lambda*eye(length(th)))*J'*dy;

%gerando os passos
dth = alfa*dth;

for j=1:length(dth) % para cada um dos elementos
  if (abs(dth(j)) > Dmax) % se o elemento for maior que o limite
  dth(j) = Dmax*dth(j)/abs(dth(j)) % satura o módulo do elemento
  end
end
th = th + dth; %novos thetas

%reconstroi o modelo
ym = th(1);
for i=1:n-1
  ym = ym + th(2*i)*exp(th((2*i)+1).*x);
endfor

%plotando em tempo real
set(h,'YData',real(ym))
title(['cont:',num2str(cont), ' modulo dth:', num2str(norm(dth))]);
drawnow;
%pause(0.02);

%criterios de parada
if norm(dth) < 1e-4 || isnan(dth(1));
  crit = 0;
endif
endwhile
