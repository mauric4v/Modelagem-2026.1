clc
clear
close all

load ('dados_estaticos.mat');
%y0
figure(1)
scatter(x0,y0)
%usando uma equaçao de segundo grau como param (nao funcionou direito)
%x^2, x e 1

A0=[x0'.^2,x0',ones(length(x0),1)];

param0 = inv(A0'*A0)* A0' * y0'

ym0 = param0(1,1).*x0.^2 + param0(2,1).*x0 + param0(3,1);

hold
plot(x0,ym0,'r');
%y1
%mesma coisa(esse foi)
figure(2)
scatter(x1,y1);

A1=[x1'.^2,x1',ones(length(x1),1)];

param1 = inv(A1'*A1)* A1' * y1'

ym1 = param1(1,1).*x1.^2 + param1(2,1).*x1 + param1(3,1);

hold
plot(x1,ym1,'r');

%y2
figure(3)
scatter(x2,y2);
%usando uma equaçao de terceiro grau como param
%x^3, x^2, x e 1

A2=[x2'.^3,x2'.^2,x2',ones(length(x2),1)];

param2 = inv(A2'*A2)* A2' * y2'

ym2 = param2(1,1).*x2.^3 + param2(2,1).*x2.^2+param2(3,1).*x2 + param2(4,1);

hold
plot(x2,ym2,'r');

%y5
figure(4)
scatter(x5,y5);

%usando uma equaçao de sexto grau como param (nao funcionou???)

A5=[x5'.^6,x5'.^5,x5'.^4,x5'.^3,x5'.^2,x5',ones(length(x5),1)];

param5 = inv(A5'*A5)* A5' * y5'

ym5 = param5(1,1).*x5.^6+param5(2,1).*x5.^5 + param5(3,1).*x5.^4+param5(4,1).*x5.^3 + param5(5,1).*x5.^2 + param5(6,1).*x5+param5(7,1);

hold
plot(x5,ym5,'r');

%y3
%pico em x=1.5 e 8
figure(5)
scatter(x3,y3);
hold
n = 0:length(x3)-1;
x = sin(2*pi*n/45);
plot(x3,x)


