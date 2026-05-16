function [y] = circuito2(u,tamos)

    t = 0:tamos:tamos*length(u)-tamos;
    s = tf('s');
    H = 2*pi*600/(s+2*pi*600);
    y = lsim(H,u,t);
    
    y = y + randn(size(y))*0.3;

end