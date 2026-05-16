function v = medidor(tamos,tfinal)

    w = 2*pi*65;
    t = 0:tamos:tfinal;
    f = (pi/2)*rand();
    v = (220*sin(w*t+f) + 20*sin(2*w*t+f) + 14*sin(3*w*t+f) + 10*sin(5*w*t+f) + 30*randn(size(t)));
end