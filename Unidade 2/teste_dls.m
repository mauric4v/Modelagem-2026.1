clc
clear
close all

load('dados_GNb');
%sigmoide
%%dados 1
x = x1(:);
y = y1(:);

n = 2; %grau da função
th = zeros(3*(n-1)+1, 1); %vetor de parametros
th(1) = (rand()*0.1) + (0) %numero prox de 0
for i = 1:n-1
    th((3*i)-1) = (rand()*-1) + (-0.5); %valor negativo
    th(3*i) = (rand()*0.5) + (-0.25); %sla
    th((3*i)+1) = (rand()*0.1) + (1); %fase prox de 1
endfor
alfa = 0.1;
Dmax = 0.8;
lambda = 1e-3;

%criando o modelo
ym = th(1);
for i=1:n-1
  ym = ym + th((3*i)-1)*tanh(x.*th(3*i) + th((3*i)+1));
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
dy = y-ym;

%criando o jacobiano
J = x.^0;
for i = 1:n-1
J = [J tanh(th(3*i).*x + th((3*i)+1)) th((3*i)-1).*x.*sech(th(3*i).*x + th((3*i)+1)).^2 th((3*i)-1).*sech(th(3*i).*x + th((3*i)+1)).^2];
endfor

dth = inv(J'*J + lambda*eye(length(th)))*J'*dy;

%gerando os passos
dth = alfa*dth;
for j=1:length(dth) % para cada um dos elementos
  if (abs(dth(j)) > Dmax) % se o elemento for maior que o limite
  dth(j) = Dmax*dth(j)/abs(dth(j)) % satura o módulo do elemento
  end
end
th = th + dth;%novos thetas

%recosntroi o modelo
ym = th(1);
for i=1:n-1
  ym = ym + th((3*i)-1)*tanh(x.*th(3*i) + th((3*i)+1));
endfor

%plotando em tempo real
set(h,'YData',real(ym))
title(['cont:',num2str(cont), ' modulo dth:', num2str(norm(dth))]);
drawnow;
pause(0.02);

%criterios de parada
if norm(dth) < 1e-4 || isnan(dth(1));
  crit = 0;
endif
endwhile

%%%%dados 2
%%x = x2(:);
%%y = y2(:);
%%
%%n = 3; %grau da função
%%th = zeros(3*(n-1)+1, 1); %vetor de parametros
%%th(1) = (rand()*0.1) + (-0.25) %numero prox de 0
%%for i = 1:n-1
%%    th((3*i)-1) = (rand()*0.1) + (-0.25); %sla
%%    th(3*i) = (rand()*0.1) + (-0.25); %sla
%%    th((3*i)+1) = (rand()*0.1) + (-0.25); %sla
%%endfor
%%alfa = 0.05;
%%Dmax = 0.8;
%%
%%%criando o modelo
%%ym = th(1);
%%for i=1:n-1
%%  ym = ym + th((3*i)-1)*tanh(x.*th(3*i) + th((3*i)+1));
%%endfor
%%
%%%figura para plotar
%%figure(1)
%%scatter(x,y);
%%hold on
%%h = plot(x,ym,'r');
%%crit = 1
%%cont=0
%%
%%while crit == 1
%%cont=cont+1
%%dy = y-ym;
%%
%%%criando o jacobiano
%%J = x.^0;
%%for i = 1:n-1
%%J = [J tanh(th(3*i).*x + th((3*i)+1)) th((3*i)-1).*x.*sech(th(3*i).*x + th((3*i)+1)).^2 th((3*i)-1).*sech(th(3*i).*x + th((3*i)+1)).^2];
%%endfor
%%
%%dth = inv(J'*J)*J'*dy;
%%
%%%gerando os passos
%%dth = alfa*dth;
%%for j=1:length(dth) % para cada um dos elementos
%%  if (abs(dth(j)) > Dmax) % se o elemento for maior que o limite
%%  dth(j) = Dmax*dth(j)/abs(dth(j)); % satura o módulo do elemento
%%  end
%%end
%%th = th + dth;%novos thetas
%%
%%%recosntroi o modelo
%%ym = th(1);
%%for i=1:n-1
%%  ym = ym + th((3*i)-1)*tanh(x.*th(3*i) + th((3*i)+1));
%%endfor
%%
%%%plotando em tempo real
%%set(h,'YData',real(ym))
%%title(['cont:',num2str(cont), ' modulo dth:', num2str(norm(dth))]);
%%drawnow;
%%pause(0.02);
%%
%%%criterios de parada
%%if norm(dth) < 1e-4 || isnan(dth(1));
%%  crit = 0;
%%endif
%%endwhile

%%%%dados 3 %deu ryim
%%x = x3(:);
%%y = y3(:);
%%
%%n = 5; %grau da função
%%th = zeros(3*(n-1)+1, 1); %vetor de parametros
%%th(1) = (rand()*1) + (-0.5) %numero prox de 0
%%for i = 1:n-1
%%    th((3*i)-1) = (rand()*2) + (-1); %sla
%%    th(3*i) = (rand()*2) + (-1); %sla
%%    th((3*i)+1) = (rand()*40) + (-20); %tao entre -20 e 20
%%endfor
%%alfa = 0.1;
%%Dmax = 0.8;
%%
%%%criando o modelo
%%ym = th(1);
%%for i=1:n-1
%%  ym = ym + th((3*i)-1)*tanh(x.*th(3*i) + th((3*i)+1));
%%endfor
%%
%%%figura para plotar
%%figure(1)
%%scatter(x,y);
%%hold on
%%h = plot(x,ym,'r');
%%crit = 1
%%cont=0
%%
%%while crit == 1
%%cont=cont+1;
%%dy = y-ym;
%%
%%%criando o jacobiano
%%J = x.^0;
%%for i = 1:n-1
%%J = [J tanh(th(3*i).*x + th((3*i)+1)) th((3*i)-1).*x.*sech(th(3*i).*x + th((3*i)+1)).^2 th((3*i)-1).*sech(th(3*i).*x + th((3*i)+1)).^2];
%%endfor
%%
%%dth = inv(J'*J)*J'*dy;
%%
%%%gerando os passos
%%dth = alfa*dth;
%%for j=1:length(dth) % para cada um dos elementos
%%  if (abs(dth(j)) > Dmax) % se o elemento for maior que o limite
%%  dth(j) = Dmax*dth(j)/abs(dth(j)); % satura o módulo do elemento
%%  end
%%end
%%th = th + dth;%novos thetas
%%
%%%recosntroi o modelo
%%ym = th(1);
%%for i=1:n-1
%%  ym = ym + th((3*i)-1)*tanh(x.*th(3*i) + th((3*i)+1));
%%endfor
%%
%%%plotando em tempo real
%%set(h,'YData',real(ym))
%%title(['cont:',num2str(cont), ' modulo dth:', num2str(norm(dth))]);
%%drawnow;
%%pause(0.02);
%%
%%%criterios de parada
%%if norm(dth) < 1e-4 || isnan(dth(1));
%%  crit = 0;
%%endif
%%endwhile

%%%%dados 4 %deuu rui
%%x = x4(:);
%%y = y4(:);
%%
%%n = 6; %grau da função
%%th = zeros(3*(n-1)+1, 1); %vetor de parametros
%%th(1) = (rand()*2) + (-1) %numero prox de 0
%%for i = 1:n-1
%%    th((3*i)-1) = (rand()*2) + (-1); %sla
%%    th(3*i) = (rand()*0.1) + (0); %sla
%%    th((3*i)+1) = (rand()*40) + (-20); %tao entre -20 e 20
%%endfor
%%alfa = 0.1;
%%Dmax = 0.8;
%%
%%%criando o modelo
%%ym = th(1);
%%for i=1:n-1
%%  ym = ym + th((3*i)-1)*tanh(x.*th(3*i) + th((3*i)+1));
%%endfor
%%
%%%figura para plotar
%%figure(1)
%%scatter(x,y);
%%hold on
%%h = plot(x,ym,'r');
%%crit = 1
%%cont=0
%%
%%while crit == 1
%%cont=cont+1;
%%dy = y-ym;
%%
%%%criando o jacobiano
%%J = x.^0;
%%for i = 1:n-1
%%J = [J tanh(th(3*i).*x + th((3*i)+1)) th((3*i)-1).*x.*sech(th(3*i).*x + th((3*i)+1)).^2 th((3*i)-1).*sech(th(3*i).*x + th((3*i)+1)).^2];
%%endfor
%%
%%dth = inv(J'*J)*J'*dy;
%%
%%%gerando os passos
%%dth = alfa*dth;
%%for j=1:length(dth) % para cada um dos elementos
%%  if (abs(dth(j)) > Dmax) % se o elemento for maior que o limite
%%  dth(j) = Dmax*dth(j)/abs(dth(j)); % satura o módulo do elemento
%%  end
%%end
%%th = th + dth;%novos thetas
%%
%%%recosntroi o modelo
%%ym = th(1);
%%for i=1:n-1
%%  ym = ym + th((3*i)-1)*tanh(x.*th(3*i) + th((3*i)+1));
%%endfor
%%
%%%plotando em tempo real
%%set(h,'YData',real(ym))
%%title(['cont:',num2str(cont), ' modulo dth:', num2str(norm(dth))]);
%%drawnow;
%%pause(0.02);
%%
%%%criterios de parada
%%if norm(dth) < 1e-4 || isnan(dth(1));
%%  crit = 0;
%%endif
%%endwhile
