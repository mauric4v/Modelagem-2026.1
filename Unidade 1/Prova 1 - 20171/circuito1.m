function [y] = circuito1(u,tamos)

    t = 0:tamos:tamos*length(u)-tamos;
    s = tf('s');
    H = 2*pi*300/(s+2*pi*300);
    y = lsim(H,u,t);
    
    y = y + randn(size(y))*0.3;

end