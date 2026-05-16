function [A , B , C] = inversor(f,tamos,tfinal)

t = [0:tamos:tfinal]';
kf = ones(size(t));
kf(t<=20) = t(t<=20)/40;
wf = 2*pi*kf*f; % de Hz para rad/s

f0 = rand()*pi/4;

wt = wf.*t;

A = 10*sin(wt + f0);
B = 10*sin(wt + f0 + 120*pi/180);
C = 10*sin(wt + f0 + 200*pi/180);

A = A + randn(size(A));
B = B + randn(size(B));
C = C + randn(size(C));
