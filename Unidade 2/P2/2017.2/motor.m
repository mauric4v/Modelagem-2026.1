function [y,t] = motor(u,tamos)

    t = 0:tamos:tamos*length(u)-tamos;
    a = 100;
    b = 5;
    H = tf(a,[1 b]);
    a = 3;
    b = 3;
    S = tf(a,[1 b]);
    y = lsim(H*S,u,t)';

    y = y + randn(size(y))*20;


end