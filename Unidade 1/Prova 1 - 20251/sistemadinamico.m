function [y] = sistemadinamico(u,tamos)

   t = 0:tamos:tamos*length(u)-tamos;
   A =  [1.421e-14        100
          -100         -1e+04];
   B = [-100 ; 200];
   C = [0 1];
   D = [0];
   H = ss(A,B,C,D);
   y = lsim(H,u,t);
   y = y + randn(size(y))*0.2;
   y(y<0)=0;

end
