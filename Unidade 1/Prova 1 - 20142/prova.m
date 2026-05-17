clc
clear
close all

[U1, U2] = meshgrid(-5:0.1:5);

[V,W] = robo(U1,U2);

subplot(211)
mesh(U1,U2,V);
subplot(212)
mesh(U1,U2,W);

%usando série de taylor

x1 = U1(:); %tranformando os dados em vetores coluna
x2 = U2(:); %tranformando os dados em vetores coluna
yV = V(:);
yW = W(:);

A = [x1.^0]; %funçao base constante
n = 1; %grau da série
for i = 1:n
  A=[A, x1.^i,x2.^i]; %matriz de funçoes base
endfor

paramV = inv(A'*A)* A' * yV; %vetor de parametros usando pseudoinversa
paramW = inv(A'*A)* A' * yW; %vetor de parametros usando pseudoinversa

ymV = A*paramV; %modelo
ymW = A*paramW;

#encontrar u1 e u2

B = [paramV(2), paramV(3) ; paramW(2),paramW(3)];

Y = [ (-7 - paramV(1)) ; (4 - paramW(1)) ];

X = inv(B) * Y;

u1 = X(1)
u2 = X(2)

#plotar os graficos dnv

for i = 1:101
     idc_final = i*101;
     idc_inicial = (idc_final - 101) + 1;

     Vreconstruido(:,i) = ymV(idc_inicial:idc_final);
     Wreconstruido(:,i) = ymW(idc_inicial:idc_final);
endfor

figure(2)
mesh(U1,U2,Vreconstruido);
hold on;
mesh(U1,U2,Wreconstruido);
