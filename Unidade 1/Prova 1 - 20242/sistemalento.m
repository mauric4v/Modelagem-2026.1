function [y] = sistemalento(u,tamos)

   t = 0:tamos:tamos*length(u)-tamos;

   A = [-0.001];
   B = [-0.1005];
   C = [-0.00995];
   D = 0;

   H = ss(A,B,C,D);
   y = lsim(H,u,t);

   y = y + randn(size(y))*2;

end
