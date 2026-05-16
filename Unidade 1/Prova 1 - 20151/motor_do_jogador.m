function [y] = motor_do_jogador(u,tamos)

%     u = [u zeros(1,length(u)-1)];
    t = 0:tamos:tamos*length(u)-tamos;
    t = t';
    wn = 4;
    zeta = 0.7;
    H = tf(4*wn^2,[1 2*zeta*wn wn^2]);
    y = lsim(H,u,t);
    y = y + randn(size(y))*0.2;


end