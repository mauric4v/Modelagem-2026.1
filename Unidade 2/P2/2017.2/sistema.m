function [y,t] = sistema(u,tamos)

    t = 0:tamos:tamos*length(u)-tamos;
    wn = 1;
    zeta = 1.3;
    ganho = 1;
    H = tf(ganho*wn^2,[1 2*zeta*wn wn^2]);
    y = lsim(H,u,t)';

    y = y + randn(1,length(y))*0.1;


end