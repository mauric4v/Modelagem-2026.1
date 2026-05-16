function [y] = filtro(u,tamos)

    t = 0:tamos:tamos*length(u)-tamos;
    a = 2.3;
    H = tf(a,[1 a]);
    y = lsim(H,u,t);
    
    y = y + randn(size(y))*0.2;

end