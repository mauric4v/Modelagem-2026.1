function [y] = voltimetro1(v)

    u = 0;
    s2 = 0.1 + abs(v)/10;
    s = sqrt(s2);
    ruido = u + s*randn(size(v));
    y = v + ruido;
    
    if y > 10, y = 10; end
    if y < -10, y = -10; end
    
end