clc
clear
close all
load('projeto_cheirinho_1.mat');

x1 = Ka(:);
x2 = Kb(:);
x3 = Ta(:);
x4 = Tb(:);
y = Y(:);

n = 3; %grau da função
th = zeros(6*(n-1)+1, 1); %vetor de parametros
%chutes iniciais
th(1) = (rand()*2) + (-1); %parametro constante
for i = 1:n-1
    th((6*i)-4) = (rand()*2) + (-1); %th(tanh)
    th((6*i)-3) = (rand()*2) + (-1); %thx1
    th((6*i)-2) = (rand()*2) + (-1); %thx2
    th((6*i)-1) = (rand()*2) + (-1); %thx3
    th(6*i) = (rand()*2) + (-1); %thx4
    th((6*i)+1) = (rand()*2) + (-1); %+th descolacemnto
endfor
alfa = 0.01;
Dmax = 0.8;
lambda = 1e-2;

%criando o modelo
ym = th(1);
for i=1:n-1
  ym = ym + th((6*i)-4)*tanh(x1.*th((6*i)-3) + x2.*th((6*i)-2)+ x3.*th((6*i)-1)+ x4.*th(6*i)+  th((6*i)+1));
endfor
dy = y - ym;
crit = 1;
cont =0;

plot(y,'*')
hold on
p1=plot(ym,'r*')

while crit == 1
cont=cont+1
dy = y-ym;

%criando o jacobiano
J = x1.^0; %derivada 1
for i = 1:n-1
    d2 = tanh(x1.*th((6*i)-3) + x2.*th((6*i)-2)+ x3.*th((6*i)-1)+ x4.*th(6*i)+  th((6*i)+1));
    d3 = th((6*i)-4).*x1.*(sech(x1.*th((6*i)-3) + x2.*th((6*i)-2)+ x3.*th((6*i)-1)+ x4.*th(6*i)+  th((6*i)+1)).^2);
    d4 = th((6*i)-4).*x2.*(sech(x1.*th((6*i)-3) + x2.*th((6*i)-2)+ x3.*th((6*i)-1)+ x4.*th(6*i)+  th((6*i)+1)).^2);
    d5 = th((6*i)-4).*x3.*(sech(x1.*th((6*i)-3) + x2.*th((6*i)-2)+ x3.*th((6*i)-1)+ x4.*th(6*i)+  th((6*i)+1)).^2);
    d6 = th((6*i)-4).*x4.*(sech(x1.*th((6*i)-3) + x2.*th((6*i)-2)+ x3.*th((6*i)-1)+ x4.*th(6*i)+  th((6*i)+1)).^2);
    d7 = th((6*i)-4).*(sech(x1.*th((6*i)-3) + x2.*th((6*i)-2)+ x3.*th((6*i)-1)+ x4.*th(6*i)+  th((6*i)+1)).^2);
J = [J d2 d3 d4 d5 d6 d7];
endfor

dth = inv(J'*J + lambda*eye(length(th)))*J'*dy; %dls

%gerando os passos
dth = alfa*dth;
for j=1:length(dth) % para cada um dos elementos
  if (abs(dth(j)) > Dmax) % se o elemento for maior que o limite
  dth(j) = Dmax*dth(j)/abs(dth(j)); % satura o módulo do elemento
  end
end

th = th + dth;

% Constrói o modelo experimental para checar o erro
ym = th(1);
for i=1:n-1
  ym = ym + th((6*i)-4)*tanh(x1.*th((6*i)-3) + x2.*th((6*i)-2)+ x3.*th((6*i)-1)+ x4.*th(6*i)+  th((6*i)+1));
endfor

%criterios de parada
if norm(dth) < 1e-4 || isnan(dth(1));
  crit = 0;
endif
respostas1 = round(ym);

acertos_treino = sum(respostas1==y);
taxa_treino = (acertos_treino*100)/length(y)


% atualizacao do grafico
  set(p1,'Ydata',ym)
  title(['interacao = ' num2str(cont),  ' e o dth = '  num2str(norm(dth))])
  drawnow

endwhile
respostas1 = round(ym);

acertos_treino = sum(respostas1==y)
taxa_treino = (acertos_treino*100)/length(y)
erros = length(y) - acertos_treino

%%th grau 3=[   5.6334;
%%    4.1956;
%%   -0.5521;
%%   -0.3007;
%%    0.9142;
%%    0.6606;
%%    6.0834;
%%   -4.5257;
%%   -0.6810;
%%   -0.6703;
%%    1.2443;
%%    1.2542;
%%   10.4953 ] %100 de acerto
