function [V , I] = medidor(u,tamos,cap)


    t = 0:tamos:tamos*length(u)-tamos;

    if cap == 0, L = 5*10^-1; end
    if cap == 1, L = 2*10^-1; end
    if cap == 2, L = 0.1*10^-1; end
    if cap == 3, L = 1*10^-1; end
    
    R = 100;
    H = tf(1,[L , R]);
    I = lsim(H,u,t)';

    I = I + randn(1,length(I))*0.1;
    V = u + randn(1,length(u))*10;

end