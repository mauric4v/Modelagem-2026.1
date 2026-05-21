clc
clear
close all

load ('filtro_bode.mat');

figure(1)
plot(t2,x2);
hold on
plot(t2,y2);

freq1= 1/(t1(2)-t1(1));
freq2= 1/(t2(2)-t2(1));
freq3= 1/(t3(2)-t3(1));
%a componente qe possui a maior freq de amostragem é a f2, que pode representar todas as frequencias
%usando serie de fourier
x = t2(:); %tranformando os dados em vetores coluna
y2 = y2(:);
x2 = x2(:);
%A=[x.^0]; %funcao base constante
w1 = 2*pi*100;
w2 = 2*pi*200;
w3 = 2*pi*1000;
w4 = 2*pi*2000;2

A=[sin(x.*w1),cos(x.*w1), sin(x.*w2),cos(x.*w2), sin(x.*w3),cos(x.*w3), sin(x.*w4),cos(x.*w4)];

paramY = inv(A'*A)* A' * y2; %vetor de parametros usando pseudoinversa
paramX = inv(A'*A)* A' * x2; %vetor de parametros usando pseudoinversa
ym=  A*paramY;
xm=  A*paramX; %modelo

figure(2)
plot(t2,xm);
hold on
plot(t2,ym);

ganho(1)=sqrt((paramY(1).^2)+(paramY(2).^2))/sqrt((paramX(1).^2)+(paramX(2).^2));
ganho(2)=sqrt((paramY(3).^2)+(paramY(4).^2))/sqrt((paramX(3).^2)+(paramX(4).^2));
ganho(3)=sqrt((paramY(5).^2)+(paramY(6).^2))/sqrt((paramX(5).^2)+(paramX(6).^2));
ganho(4)=sqrt((paramY(7).^2)+(paramY(8).^2))/sqrt((paramX(7).^2)+(paramX(8).^2));

w = [w1 w2 w3 w4];
Hs1 = 32./(w+32);
Hs2 = 64./(w+64);

figure(3)
semilogx(w,Hs1,'b');
hold on
semilogx(w,Hs2,'r');
semilogx(w,ganho,'m');
grid on
