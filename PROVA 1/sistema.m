function [y] = sistema(u,tamos)

   t = 0:tamos:tamos*length(u)-tamos;
   A = [-1.315e-13 2000 ; -1000 -2e+05];
   B = [40 -7920]';
   C = [0  100];
   D = 4;
   H = ss(A,B,C,D);
   y = lsim(H,u,t);
   y = y + randn(size(y))*0.2 + 0.2;
end
