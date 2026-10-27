clc
clear
close all

load resposta_ao_degrau.mat

%matriz de mauri
%%A = [0 1;-23.49 -14.55]; %p/dados 2
%%B = [0 ; 70.5];
%%A = [0 1;-0.975 -1]; %p/dados 3
%%B = [0 ; 1.945];
A = [0;-3.5]; %p/dados 1
B = [1.945];
C = [1 0];
D = 0;

tamos = 0.01;
%t = 0:tamos:4;
t = 0:tamos:15;
t = t(:)
u = ones(size(t));
%u = sin(t);
X = [0 ; 0]; %condicao inicial
y_e = C*X + D*u(1); %saida do metodo de euler

%inicio metodo de euler
for k = 1:length(t)-1
  Fi_e = A*X + B*u(k);

  X = X + Fi_e*tamos;
  y_e(k + 1) = C*X + D*u(k+1);
end

X = [0 ; 0]; %condicao inicial
y_h = C*X + D*u(1);%saida do metodo de heun

%inicio metodo de heun
for k = 1:length(t)-1
  Fi_1 = A*X + B*u(k); %estimativa de inclinaçao inicial
  X_e = X + Fi_1*tamos; %estimativa inical de k+1
  Fi_2= A*X_e + B*u(k+1); %estimativa de inclinacao k+1
  Fi_h = (Fi_1+Fi_2)/2; %media das inclinacoes

  X = X+Fi_h*tamos; %acha k+1
  y_h(k + 1) = C*X + D*u(k+1);
end

X = [0 ; 0]; %condicao inicial
y_p = C*X + D*u(1);%saida do ponto medio

%inicio metodo do ponto medio
for k = 1:length(t)-1
  Fi_1 = A*X + B*u(k); %estimativa de inclinaçao inicial
  X_12 = X + Fi_1*tamos/2; %estimativa de k + 1/2
  Fi_p= A*X_12 + B*u(k); %estimativa de inclinacao do ponto medio

  X = X+Fi_p*tamos; %acha k+1
  y_p(k + 1) = C*X + D*u(k+1);
end

X = [0 ; 0]; %condicao inicial
y_rg3 = C*X + D*u(1);%saida do range lutta

%inicio metodo range kutta 3 ordem
for k = 1:length(t)-1
  F1 = A*X + B*u(k); %estimativa F1
  X2 = X + F1*tamos/2; %estimativa de k + 1/2
  F2= A*X2 + B*u(k); %estimativa de inclinacao do k+2

  X3 = X - F1*tamos + 2*F2*tamos; %acha k+1
  F3 = A*X3 + B*u(k+1);

  X = X + tamos*(F1+(4*F2)+F3)*(1/6); %inclinacao final
  y_rg3(k + 1) = C*X + D*u(k+1);
end

X = [0 ; 0]; %condicao inicial
y_rg4 = C*X + D*u(1);%saida do range lutta

%inicio metodo range kutta 4 ordem
for k = 1:length(t)-1
  F1 = A*X + B*u(k); %estimativa F1
  X2 = X + F1*tamos/2; %estimativa de k + 1/2
  F2= A*X2 + B*u(k); %estimativa de inclinacao do k+1/2

  X3 = X + F2*tamos/2; %acha k+1/2 denovo
  F3 = A*X3 + B*u(k);

  X4 = X + F3*tamos;
  F4 = A*X4 + B*u(k+1);
  X = X + tamos*(F1+(2*F2)+(2*F3)+F4)*(1/6); %inclinacao final
  y_rg4(k + 1) = C*X + D*u(k+1);
end

%scatter(t2,y2);
scatter(t1,y1);
hold on
plot(t, y_e,'r');
hold on
plot(t,y_h,'g');
plot(t,y_p,'m');
plot(t,y_rg3,'k');
plot(t,y_rg4,'y');

vetor_tamos = 0.001:0.001:0.5;
eqm_e = zeros(size(vetor_tamos));
eqm_h = zeros(size(vetor_tamos));
eqm_p = zeros(size(vetor_tamos));
eqm_rg3 = zeros(size(vetor_tamos));
eqm_rg4 = zeros(size(vetor_tamos));
%testar erros
for i = 1:length(vetor_tamos);

  t = 0:vetor_tamos(i):15;

  u = ones(size(t));
    %u = sin(t);
    X = [0 ; 0]; %condicao inicial
    y_e = C*X + D*u(1); %saida do metodo de euler

    %inicio metodo de euler
    for k = 1:length(t)-1
      Fi_e = A*X + B*u(k);

      X = X + Fi_e*vetor_tamos(i);
      y_e(k + 1) = C*X + D*u(k+1);
    end

    X = [0 ; 0]; %condicao inicial
    y_h = C*X + D*u(1);%saida do metodo de heun

    %inicio metodo de heun
    for k = 1:length(t)-1
      Fi_1 = A*X + B*u(k); %estimativa de inclinaçao inicial
      X_e = X + Fi_1*vetor_tamos(i); %estimativa inical de k+1
      Fi_2= A*X_e + B*u(k+1); %estimativa de inclinacao k+1
      Fi_h = (Fi_1+Fi_2)/2; %media das inclinacoes

      X = X+Fi_h*vetor_tamos(i); %acha k+1
      y_h(k + 1) = C*X + D*u(k+1);
    end

    X = [0 ; 0]; %condicao inicial
    y_p = C*X + D*u(1);%saida do ponto medio

    %inicio metodo do ponto medio
    for k = 1:length(t)-1
      Fi_1 = A*X + B*u(k); %estimativa de inclinaçao inicial
      X_12 = X + Fi_1*vetor_tamos(i)/2; %estimativa de k + 1/2
      Fi_p= A*X_12 + B*u(k); %estimativa de inclinacao do ponto medio

      X = X+Fi_p*vetor_tamos(i); %acha k+1
      y_p(k + 1) = C*X + D*u(k+1);
    end

    X = [0 ; 0]; %condicao inicial
y_rg3 = C*X + D*u(1);%saida do range lutta

%inicio metodo range kutta 3 ordem
for k = 1:length(t)-1
  F1 = A*X + B*u(k); %estimativa F1
  X2 = X + F1*tamos/2; %estimativa de k + 1/2
  F2= A*X2 + B*u(k); %estimativa de inclinacao do k+2

  X3 = X - F1*tamos + 2*F2*tamos; %acha k+1
  F3 = A*X3 + B*u(k+1);

  X = X + tamos*(F1+(4*F2)+F3)*(1/6); %inclinacao final
  y_rg3(k + 1) = C*X + D*u(k+1);
end

X = [0 ; 0]; %condicao inicial
y_rg4 = C*X + D*u(1);%saida do range lutta

%inicio metodo range kutta 4 ordem
for k = 1:length(t)-1
  F1 = A*X + B*u(k); %estimativa F1
  X2 = X + F1*tamos/2; %estimativa de k + 1/2
  F2= A*X2 + B*u(k); %estimativa de inclinacao do k+1/2

  X3 = X + F2*tamos/2; %acha k+1/2 denovo
  F3 = A*X3 + B*u(k);

  X4 = X + F3*tamos;
  F4 = A*X4 + B*u(k+1);
  X = X + tamos*(F1+(2*F2)+(2*F3)+F4)*(1/6); %inclinacao final
  y_rg4(k + 1) = C*X + D*u(k+1);
end

     th=[   3.0010 -  0.0000i; %para dados 2
    0.4279 +  0.0000i;
  -12.7205 +  0.0038i;
   -3.4471 -  0.0001i;
   -1.8521 -  0.0000i ];
    y = th(1);
    for j=1:2
      y = y + th(2*j)*exp(th((2*j)+1).*t);
    endfor
    y=real(y);

   eqm_e(i) = mean((y-y_e).^2);
   eqm_h(i) = mean((y-y_h).^2);
   eqm_p(i) = mean((y-y_p).^2);
   eqm_rg3(i) = mean((y-y_rg3).^2);
   eqm_rg4(i) = mean((y-y_rg4).^2);
endfor

figure(2)
semilogy(vetor_tamos,eqm_e,'r');
hold on
semilogy(vetor_tamos,eqm_h,'b');
hold on
semilogy(vetor_tamos,eqm_p,'g');
hold on
semilogy(vetor_tamos,eqm_rg3,'k');
hold on
semilogy(vetor_tamos,eqm_rg4,'y');

%p/dados 3
A = [0 1;-0.975 -1]; %p/dados 3
B = [0 ; 1.945];
eqm_e = zeros(size(vetor_tamos));
eqm_h = zeros(size(vetor_tamos));
eqm_p = zeros(size(vetor_tamos));
%testar erros
for i = 1:length(vetor_tamos);

  t = 0:vetor_tamos(i):15;

  u = ones(size(t));
    %u = sin(t);
    X = [0 ; 0]; %condicao inicial
    y_e = C*X + D*u(1); %saida do metodo de euler

    %inicio metodo de euler
    for k = 1:length(t)-1
      Fi_e = A*X + B*u(k);

      X = X + Fi_e*vetor_tamos(i);
      y_e(k + 1) = C*X + D*u(k+1);
    end

    X = [0 ; 0]; %condicao inicial
    y_h = C*X + D*u(1);%saida do metodo de heun

    %inicio metodo de heun
    for k = 1:length(t)-1
      Fi_1 = A*X + B*u(k); %estimativa de inclinaçao inicial
      X_e = X + Fi_1*vetor_tamos(i); %estimativa inical de k+1
      Fi_2= A*X_e + B*u(k+1); %estimativa de inclinacao k+1
      Fi_h = (Fi_1+Fi_2)/2; %media das inclinacoes

      X = X+Fi_h*vetor_tamos(i); %acha k+1
      y_h(k + 1) = C*X + D*u(k+1);
    end

    X = [0 ; 0]; %condicao inicial
    y_p = C*X + D*u(1);%saida do ponto medio

    %inicio metodo do ponto medio
    for k = 1:length(t)-1
      Fi_1 = A*X + B*u(k); %estimativa de inclinaçao inicial
      X_12 = X + Fi_1*vetor_tamos(i)/2; %estimativa de k + 1/2
      Fi_p= A*X_12 + B*u(k); %estimativa de inclinacao do ponto medio

      X = X+Fi_p*vetor_tamos(i); %acha k+1
      y_p(k + 1) = C*X + D*u(k+1);
    end

    X = [0 ; 0]; %condicao inicial
y_rg3 = C*X + D*u(1);%saida do range lutta

%inicio metodo range kutta 3 ordem
for k = 1:length(t)-1
  F1 = A*X + B*u(k); %estimativa F1
  X2 = X + F1*tamos/2; %estimativa de k + 1/2
  F2= A*X2 + B*u(k); %estimativa de inclinacao do k+2

  X3 = X - F1*tamos + 2*F2*tamos; %acha k+1
  F3 = A*X3 + B*u(k+1);

  X = X + tamos*(F1+(4*F2)+F3)*(1/6); %inclinacao final
  y_rg3(k + 1) = C*X + D*u(k+1);
end

X = [0 ; 0]; %condicao inicial
y_rg4 = C*X + D*u(1);%saida do range lutta

%inicio metodo range kutta 4 ordem
for k = 1:length(t)-1
  F1 = A*X + B*u(k); %estimativa F1
  X2 = X + F1*tamos/2; %estimativa de k + 1/2
  F2= A*X2 + B*u(k); %estimativa de inclinacao do k+1/2

  X3 = X + F2*tamos/2; %acha k+1/2 denovo
  F3 = A*X3 + B*u(k);

  X4 = X + F3*tamos;
  F4 = A*X4 + B*u(k+1);
  X = X + tamos*(F1+(2*F2)+(2*F3)+F4)*(1/6); %inclinacao final
  y_rg4(k + 1) = C*X + D*u(k+1);
end

    th=[  1.9974 + 0.0000i; %para dados 3
  -0.9969 - 0.5550i;
  -0.4836 - 0.8594i;
  -0.9957 + 0.5548i;
  -0.4832 + 0.8597i ];

    y = th(1);
    for j=1:2
      y = y + th(2*j)*exp(th((2*j)+1).*t);
    endfor
    y=real(y);

   eqm_e(i) = mean((y-y_e).^2);
   eqm_h(i) = mean((y-y_h).^2);
   eqm_p(i) = mean((y-y_p).^2);
   eqm_rg3(i) = mean((y-y_rg3).^2);
   eqm_rg4(i) = mean((y-y_rg4).^2);

endfor

figure(3)
plot(vetor_tamos,eqm_e,'r');
hold on
plot(vetor_tamos,eqm_h,'b');
hold on
plot(vetor_tamos,eqm_p,'g');
plot(vetor_tamos,eqm_rg3,'k');
%plot(vetor_tamos,eqm_rg4,'y');

