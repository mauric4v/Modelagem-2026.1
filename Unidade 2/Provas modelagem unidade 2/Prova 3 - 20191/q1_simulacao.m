clc
clear
close all
pkg load control
A = [0 1;-1092 -68]; %p/dados 2
B = [0 ; 16380];
C = [1 0];
D = 0;

tamos = 0.001;
t = 0:tamos:0.5;

V = 9*ones(size(t));  %entrada constante 9V
%gerar pwm
freq = 50;
T = 1/freq;
D_pwm = 75;
H = (D_pwm*T)/100;
sinal = zeros(size(t));

for i = 1:length(t)
  if mod(t(i),T) < H
    sinal(i) = 1;
  endif
endfor

%%%

V = 9*ones(size(t));
[W] = motorcc(V,tamos);
t = t(:);
W = W(:);
u = 12*sinal;

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

scatter(t,W);
hold on
plot(t, y_rg4,'r','linewidth',2);

   load respostas.mat
   figure(2)
   plot(t,y_9v,'b');
   hold on
   plot(t,y_20,'r');
   plot(t,y_50,'g');

   if  mean((y_9v-y_20).^2) < mean((y_9v-y_20).^2)
    vihz_melhor = 1
    cihz_melhor = 0
  else
    vihz_melhor = 0
    cihz_melhor = 1
   endif

