function [y] = voltimetro5(v)

    u = -0.2;
    s2 = 0.05;
    s = sqrt(s2);
    ruido = u + s*randn(size(v));
    y = v + ruido;

end