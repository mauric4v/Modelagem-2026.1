function [y] = sistema(u,tamos)

    t = 0:tamos:tamos*length(u)-tamos;
    s = tf('s');
    H = 12/((s+6)*(s+2));
    y = lsim(H,u,t);
    
    y = y + randn(size(y))*1;

end