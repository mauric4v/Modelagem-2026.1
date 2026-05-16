function [y] = filtro3(u,tamos)

    t = 0:tamos:tamos*length(u)-tamos;
    s = tf('s');
    H = ((s+377)^2)/((s+37.7)*(s+3770));
    y = lsim(H,u,t);
    
    y = y + rand(size(y))*0.2 - 0.2/2;

end