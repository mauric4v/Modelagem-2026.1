clc
clear
close all

[U1, U2] = meshgrid(-5:0.1:5);

[V,W] = robo(U1,U2);

subplot(211)
mesh(U1,U2,V);
subplot(212)
mesh(U1,U2,W);

A0=[U1(:).^0];
nexp=1
for i = 1:nexp
  A0=[A0, U1(:).^i,U2(:).^i];
endfor

paramW = inv(A0'*A0)* A0' * W(:);
ymW = A0*paramW;

YMW=reshape(ymW, size(U1));

paramV = inv(A0'*A0)* A0' * V(:);
ymV = A0*paramV;

YMV=reshape(ymV, size(U1));

figure(2)
mesh(U1,U2,YMW);
hold on;
surf(U1,U2,YMV);
xlabel('U1');
ylabel('U2');


