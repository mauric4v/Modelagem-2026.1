function [y] = filtro_ativo(u,tamos)

    t = 0:tamos:tamos*length(u)-tamos;
    s = tf('s');
    a = 0.001;
    b = 0.003;
    H = a/((s+b)^2);
    y = lsim(H,u,t);
    
    y = y + (randn(size(y))*0.2)*max(abs(y));

end