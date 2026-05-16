function [y] = motor(u,tamos)

%     u = [u zeros(1,length(u)-1)];
    t = 0:tamos:tamos*length(u)-tamos;
    wn = 1;
    zeta = 0.2;
    H = tf(wn^2,[1 2*zeta*wn wn^2]);
    K = 13/(mean(u)+0.3);
    H = K*H;
    y = lsim(H,u,t)';

    y = y + randn(1,length(y))*0.1;


end