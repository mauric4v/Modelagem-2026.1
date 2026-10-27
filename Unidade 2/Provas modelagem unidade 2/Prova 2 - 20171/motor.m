function [y,t] = motor(u,tamos)

    t = 0:tamos:tamos*length(u)-tamos;
    wn = 20;
    zeta = 1.3;
    ganho = 20;
    H = tf(ganho*wn^2,[1 2*zeta*wn wn^2]);
    y = lsim(H,u,t)';
    y = y + randn(1,length(y))*5;
    y = round(y);
    
    y(y>200)=200;
    y(y<-200)=-200; 


end