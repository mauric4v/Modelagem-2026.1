clc
clear
close all

x = [-3:0.4:3]';
y = x.^4;
alfa = 0.8;
th = 4.5;
mod = x.^th;

figure(1)
scatter(x,y);
hold on
h = plot(x,mod,'r');
crit = 1
i=0
Dmax = 0.5
while crit == 1
i=i+1
mod = x.^th;

d1 = log(x).*(x.^th);

dy = y-mod;

J = [d1];

dth = inv(J'*J)*J'*dy;

dth = alfa*dth;

if (norm(dth) > Dmax) % se a norma for maior que o limite
dth = Dmax*dth/norm(dth) % satura a norma
end

th = th + dth;
set(h,'YData',real(mod))
drawnow;
pause(0.05);
if norm(dth) < 1e-4 || isnan(dth(1));
  crit = 0;
endif
endwhile
