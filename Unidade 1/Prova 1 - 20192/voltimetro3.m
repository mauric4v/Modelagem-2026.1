function [y] = voltimetro3(v)

    if rand > 0.5
        u = -0.2;
        s2 = 0.02;
        s = sqrt(s2);
        ruido = u + s*randn(size(v));
    else
        u =  0.2;
        s2 = 0.1;
        s = sqrt(s2);
        ruido = u + s*randn(size(v));
    end
    y = v + ruido;
    
    if y > 10, y = 10; end
    if y < -10, y = -10; end

end