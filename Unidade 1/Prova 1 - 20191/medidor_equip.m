function [V , I] = medidor_equip(u,tamos)


    t = 0:tamos:tamos*length(u)-tamos;

    L = 1*10^-1;    
    R = 100;
    
    H = tf(1,[L , R]);
    I = lsim(H,u,t)';

    I = I + randn(size(I))*0.1;
    V = u + randn(size(u))*10;

end