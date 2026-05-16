function [y] = filtro2(u,tamos)

    t = 0:tamos:tamos*length(u)-tamos;
    s = tf('s');
    H = 3/(s+3);
    y = lsim(H,u,t);
    
    y = y + rand(size(y))*0.2 - 0.2/2;

end