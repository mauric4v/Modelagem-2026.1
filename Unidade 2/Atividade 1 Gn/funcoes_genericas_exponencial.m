clc
clear
close all

load('dados_GNa');

%funcao exponencial

 %%dados 1%%
x = x1(:);
y = y1(:);
n = 2; %grau da função
th = zeros((n*2)-1, 1); %vetor de parametros
%chutes
th(1) = (rand()*0.1) -0.05; %param constante parece ser proximo de 0
for i = 1:n-1
    th(2*i) = (rand()*0.5) -(0); %valores positivos
    th((2*i)+1) = (rand()*0.5) +(0);
endfor
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

while crit == 1
cont=cont+1
dy = y-ym; %erro dy

%criando o jacobiano
J = x.^0;
for i = 1:n-1
J = [J exp(th((2*i)+1).*x) x.*th(2*i).*exp(th((2*i)+1).*x)]; %derivadas das exponenciais
endfor

dth = inv(J'*J)*J'*dy;

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


%%dados 2%%
x = x2(:);
y = y2(:);
n = 2; %grau da função
th = zeros((n*2)-1, 1); %vetor de parametros
th(1) = (rand()*0.5) -0.05; %param constante parece ser proximo de 0
for i = 1:n-1
    th(2*i) = (rand()*0.5) +(0); %valores positivos
    th((2*i)+1) = (rand()*0.5) +(0);
endfor
alfa = 0.1; %amortecimento
Dmax = 0.8; %valor de saturacao

%criando o modelo
ym = th(1);
for i=1:n-1
  ym = ym + th(2*i)*exp(th((2*i)+1).*x);
endfor

%figura para plotar
figure(2)
scatter(x,y);
hold on
h = plot(x,ym,'r');
crit = 1
cont=0

while crit == 1
cont=cont+1
dy = y-ym; %erro dy

%criando o jacobiano
J = x.^0;
for i = 1:n-1
J = [J exp(th((2*i)+1).*x) x.*th(2*i).*exp(th((2*i)+1).*x)]; %derivadas das exponenciais
endfor

dth = inv(J'*J)*J'*dy;

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

%%dados 3%%
x = x3(:);
y = y3(:);
n = 3; %grau da função
th = zeros((n*2)-1, 1); %vetor de parametros
th(1) = (rand()*1) + 0; %param constante parece ser proximo de 2
for i = 1:n-1
    th(2*i) = (rand()*-1) +(0); %valores negativos
    th((2*i)+1) = (rand()*1) +(-1);
endfor
alfa = 0.1; %amortecimento
Dmax = 0.8; %valor de saturacao

%criando o modelo
ym = th(1);
for i=1:n-1
  ym = ym + th(2*i)*exp(th((2*i)+1).*x);
endfor

%figura para plotar
figure(3)
scatter(x,y);
hold on
h = plot(x,ym,'r');
crit = 1;
cont=0;

while crit == 1
cont=cont+1
dy = y-ym; %erro dy

%criando o jacobiano
J = x.^0;
for i = 1:n-1
J = [J exp(th((2*i)+1).*x) x.*th(2*i).*exp(th((2*i)+1).*x)]; %derivadas das exponenciais
endfor

dth = inv(J'*J)*J'*dy;

%gerando os passos
dth = alfa*dth;

for j=1:length(dth) % para cada um dos elementos
  if (abs(dth(j)) > Dmax) % se o elemento for maior que o limite
  dth(j) = Dmax*dth(j)/abs(dth(j)); % satura o módulo do elemento
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

%%dados 4%%
x = x4(:);
y = y4(:);
n = 2; %grau da função
th = zeros((n*2)-1, 1); %vetor de parametros
th(1) = (rand()*1) + 1.5; %param constante parece ser proximo de 2
for i = 1:n-1
    th(2*i) = (rand()*1) +(-1); %valores negativos
    th((2*i)+1) = (rand()*1) +(-1);
endfor
alfa = 0.1; %amortecimento
Dmax = 0.8; %valor de saturacao

%criando o modelo
ym = th(1);
for i=1:n-1
  ym = ym + th(2*i)*exp(th((2*i)+1).*x);
endfor

%figura para plotar
figure(4)
scatter(x,y);
hold on
h = plot(x,ym,'r');
crit = 1;
cont=0;

while crit == 1
cont=cont+1
dy = y-ym; %erro dy

%criando o jacobiano
J = x.^0;
for i = 1:n-1
J = [J exp(th((2*i)+1).*x) x.*th(2*i).*exp(th((2*i)+1).*x)]; %derivadas das exponenciais
endfor

dth = inv(J'*J)*J'*dy;

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
