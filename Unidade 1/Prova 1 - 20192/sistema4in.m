function [a] = sistema4in(x,y,z,w)

a = -1*x.^2 + -3*y + 1*y.^2 + 0.1*z.^3 + 2*z + -1*w;

a = a + randn(size(a))*10;
    
end