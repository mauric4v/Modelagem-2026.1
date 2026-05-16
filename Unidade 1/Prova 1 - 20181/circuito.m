function [y] = circuito(u,tamos)

    t = 0:tamos:tamos*length(u)-tamos;
    s = tf('s');
    R = 4700;
    C = 33*10^(-9);
    a = 1/(R*C);
    H = a/(s+a);
    y = lsim(H,u,t);
    
    y = y + (randn(size(y))*0.1)*max(abs(y));

end