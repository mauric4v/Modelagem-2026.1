clc
clear
close all
load('dados_iris.mat');
%treino
x1 = iris_treino1(:,1);
x2 = iris_treino1(:,2);
x3 = iris_treino1(:,3);
x4 = iris_treino1(:,4);
y = iris_treino1(:,5);

n = 4; %grau da função
th = zeros((6*n)+1, 1); %vetor de parametros
%chutes iniciais
th(1) = (rand()*2) + (-1); %parametro constante
for i = 1:n
    th((6*i)-4) = (rand()*2) + (-1); %th(tanh)
    th((6*i)-3) = (rand()*2) + (-1); %thx1
    th((6*i)-2) = (rand()*2) + (-1); %thx2
    th((6*i)-1) = (rand()*2) + (-1); %thx3
    th(6*i) = (rand()*2) + (-1); %thx4
    th((6*i)+1) = (rand()*2) + (-1); %+th descolacemnto
endfor
alfa = 0.1;
Dmax = 0.8;
lambda = 1e-3;

%criando o modelo
ym = th(1);
for i=1:n
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
for i = 1:n
    tangH = tanh(x1.*th((6*i)-3) + x2.*th((6*i)-2)+ x3.*th((6*i)-1)+ x4.*th(6*i)+  th((6*i)+1));
    d2 = tangH;
    d7 = th((6*i)-4).*(1-tangH.^2);
    d3 = d7.*x1;
    d4 = d7.*x2;
    d5 = d7.*x3;
    d6 = d7.*x4;
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
for i=1:n
  ym = ym + th((6*i)-4)*tanh(x1.*th((6*i)-3) + x2.*th((6*i)-2)+ x3.*th((6*i)-1)+ x4.*th(6*i)+  th((6*i)+1));
endfor

%criterios de parada
if norm(dth) < 1e-2 || isnan(dth(1));
  crit = 0;
endif

% atualizacao do grafico
  set(p1,'Ydata',ym)
  title(['interacao = ' num2str(cont),  ' e o dth = '  num2str(norm(dth))])
  drawnow

endwhile
respostas1 = round(ym);

acertos_treino = sum(respostas1==y)
taxa_treino = (acertos_treino*100)/length(y)

x1t = iris_teste3(:,1);
x2t = iris_teste3(:,2);
x3t = iris_teste3(:,3);
x4t = iris_teste3(:,4);
yt = iris_teste3(:,5);

ymt = th(1);
for i=1:n
  ymt = ymt + th((6*i)-4)*tanh(x1t.*th((6*i)-3) + x2t.*th((6*i)-2)+ x3t.*th((6*i)-1)+ x4t.*th(6*i)+  th((6*i)+1));
endfor

respostas_teste = round(ymt);

acertos_teste = sum(respostas_teste==yt)
taxa_teste = (acertos_teste*100)/length(yt)

%parametros grupo 1 =
%[2.1968; 1.2365; -0.1790; -0.3195; 0.4151;0.6107; -0.7394]
%acertos_treino = 117 taxa_treino = 97.500
%acertos_teste = 30 taxa_teste = 100

%parametros grupo 2
%[2.1926;1.2477;-0.1167;-0.3249;0.3220;0.7073;-0.7944]
%acertos_treino = 115 taxa_treino = 95.833
%acertos_teste = 30 taxa_teste = 100

%parametros grupo 3
%[2.2013;1.2469;-0.1552;-0.3880;0.3491;0.7284;-0.5605 ]
%acertos_treino = 117 taxa_treino = 97.500
%acertos_teste = 29 taxa_teste = 96.667
