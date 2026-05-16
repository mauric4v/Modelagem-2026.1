function [y] = sistemadinamico(u,tamos)

   t = 0:tamos:tamos*length(u)-tamos;

   A = [-1.185e-15   1.206e-14          10
             10  -1.172e-14         102
              0        -100        -201];
   B = [0.3 ; 300 ; 0];
   C = [0 0 -100];
   D = 0;

   H = ss(A,B,C,D);
   y = lsim(H,u,t);

   y = y + randn(size(y))*2;

end
