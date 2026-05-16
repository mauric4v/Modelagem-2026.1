function [y] = amperimetro(v)

    u = 0;
    ruido = u + (1 + (v.^2)/2500).*randn(size(v));
    y = v + ruido;
    if y > 100, y = 100; end
    if y < -100, y = -100; end

end
