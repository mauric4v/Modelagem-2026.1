function [y] = voltimetro1(v)

    u = 0;
    s2 = 0.02; %classe A
    s = sqrt(s2);
    ruido = u + s*randn(size(v));
    y = v + ruido;

end
