clc
clear
close all

x = [0 1 2]';
y = [3 2 1]';
alfa = 0.1;
th = rand(2,1)*2 -1;
mod = th(1) .* exp(th(2).*x);

figure(1)
scatter(x,y);
hold on
h = plot(x,mod,'r');
crit = 1
i=0
while crit == 1
i=i+1
mod = th(1) .* exp(th(2).*x);

dth1 = exp(th(2).*x);
dth2 = x.*th(1) .* exp(th(2).*x);

dy = y-mod;

J = [dth1 dth2];

dth = inv(J'*J)*J'*dy;

th = th + 0.1*dth;
set(h,'YData',real(mod))
drawnow;
pause(0.03);
if norm(dth) < 1e-4 || isnan(dth(1));
  crit = 0;
endif
endwhile
