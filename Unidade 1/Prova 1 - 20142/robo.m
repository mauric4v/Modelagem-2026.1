function [V , W] = robo(U1,U2)

r1 = 3.37;
r2 = 3.93;

v1 = U1*r1;
v2 = U2*r2;

L = 1.25;

V = v1/2 + v2/2;
W = v1/(2*L) - v2/(2*L);

V = V + randn(size(V))*1;
W = W + randn(size(W))*1;

end

