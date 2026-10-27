clc
clear
close all

tamos = 0.01;
fa = 1/tamos;
res = 100; %resolucao do bode
w = logspace(-1, 2, res);
ganho = zeros(1,res);
fase = zeros(1,res);
fase_deg = zeros(1,res);

for i = 1:length(w)
    i
    A = [0 1;-20.51 -1.2]; %p/Y(s)
    B = [0 ; 13.94];
    C = [1 0];
    D = 0;
    t = 0:tamos:100;
    t = t(:);

    u = 100*sin(w(i)*t);

    X = [0;0]; %condicao inicial
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

    ganho(i)= max(abs(y_rg4))/max(abs(u));
end
figure(1)
mdb = 20*log10(ganho); %calculo em db
semilogx(w, mdb) %plot de ganho
grid on
[a,id_maiorganho] = max(mdb);
freq_maiorganho = w(id_maiorganho)
hold on
s = 1j*w;
Hs = (13.94)./(s.^2 + 1.2.*s+ 20.51);
Hmdb = 20*log10(abs(Hs));
semilogx(w,Hmdb)

