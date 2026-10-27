function [y] = sistemadinamico(u,tamos)

   t = 0:tamos:tamos*length(u)-tamos;

   A = [-26    -8  -2.5
             16     0     0
              0     4     0];
   B = [2 ; 0 ; 0];
   C = [0 0 1.25];
   D = 0;

   H = ss(A,B,C,D);
   y = lsim(H,u,t);

   y = y + randn(size(y))*0.5;

end

 