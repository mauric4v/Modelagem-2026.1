function [y] = voltimetro3(v)

    u = 0;
    s2 = 0.14;
    s = sqrt(s2);
    ruido = u + s*randn(size(v));
    y = v + ruido;

end