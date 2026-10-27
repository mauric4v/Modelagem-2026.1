clc
clear
close all

load('dados_GNa');
figure(1)
scatter(x3,y3);
%funcao exponencial
x = x3(:);
y = y3(:);
n = 3; %grau da função
th = zeros((n*2)-1, 1);
th(1) = 1;
for i = 1:n-1
    th(2*i) = rand() * -1;
    th((2*i)+1) = rand()* -1;
endfor
alfa = 0.1;
Dmax = 0.5;
%criando o modelo
ym = th(1);
for i=1:n-1
  ym = ym + th(2*i)*exp(th((2*i)+1).*x);
endfor
%figura para plotar
figure(2)
scatter(x,y);
hold on
h = plot(x,ym);
crit = 1
cont=0

while crit == 1
cont=cont+1

dy = y-ym;
%criando o jacobiano
J = x.^0;
for i = 1:n-1
J = [J exp(th((2*i)+1).*x) x.*th(2*i).*exp(th((2*i)+1).*x)];
endfor
dth = inv(J'*J)*J'*dy;

dth = alfa*dth;

if (norm(dth) > Dmax) % se a norma for maior que o limite
dth = Dmax*dth/norm(dth); % satura a norma
end

th = th + dth;
ym = th(1);
for i=1:n-1
  ym = ym + th(2*i)*exp(th((2*i)+1).*x);;
endfor
set(h,'YData',real(ym))
drawnow;
pause(0.02);
if norm(dth) < 1e-4 || isnan(dth(1));
  crit = 0;
endif
endwhile
