function [y,t] = sistemacontrolado(u,tamos)

    t = 0:tamos:tamos*length(u)-tamos;
    H = tf(6,[1 9]);
    y = lsim(H,u,t)';

    y = y + randn(1,length(y))*0.1;


end