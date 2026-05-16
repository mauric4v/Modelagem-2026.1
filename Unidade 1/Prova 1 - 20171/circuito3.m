function [y] = circuito3(u,tamos)

    t = 0:tamos:tamos*length(u)-tamos;
    s = tf('s');
    H = ((s+2*pi*180)^2*(s+2*pi*1125)^2)/((s+2*pi*450)^4);
    y = lsim(H,u,t);
    
    y = y + randn(size(y))*0.3;

end