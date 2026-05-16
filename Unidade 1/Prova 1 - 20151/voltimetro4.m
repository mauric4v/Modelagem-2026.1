function [y] = voltimetro4(v)

    u = 0;
    s2 = 0.05;
    s = sqrt(s2);
    ruido = u + s*randn(size(v));
    y = v + ruido;

end