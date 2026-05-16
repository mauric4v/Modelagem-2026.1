function [y] = filtro1(u,tamos)

    t = 0:tamos:tamos*length(u)-tamos;
    s = tf('s');
    H = 377/(s+377);
    y = lsim(H,u,t);
    
    y = y + rand(size(y))*0.2 - 0.2/2;

end