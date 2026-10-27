function [y] = motorcc(u,tamos)

    t = 0:tamos:tamos*length(u)-tamos;
    s = tf('s');
    H = 15*(30*35)/((s+30)*(s+35));
    y = lsim(H,u,t);
    
    y = y + randn(size(y))*5;

end