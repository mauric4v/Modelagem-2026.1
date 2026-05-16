function [y] = sistema_dinamico(u,tamos)

    H = ss(-0.3,0.51,1,0.3);

    t = 0:tamos:tamos*length(u)-tamos;
    y = lsim(H,u,t);
    y = y + randn(size(y))*0.2;

end
