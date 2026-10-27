function [y] = filtro(u,tamos)

    t = 0:tamos:tamos*length(u)-tamos;
    a = 2.3;
    H = tf(0.2,[1 0.2 0.1]);

    y = lsim(H,u,t);
    
    y = y + randn(size(y))*4;

end