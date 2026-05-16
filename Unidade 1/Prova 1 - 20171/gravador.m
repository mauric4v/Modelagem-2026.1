function v = gravador(b,tamos,tfinal)


    t = 0:tamos:tfinal;
%     f = (pi/2)*rand();
    v = 0;
    for wt=50:50:6000
        v = v + (5*rand -2.5)*sin(2*pi*wt*t+(pi/2)*rand());
    end
    v = v + randn(size(t));
    
    if b == 1
        w = 2*pi*150;
    end
    if b == 2
        w = 2*pi*500;
    end
    if b == 3
        w = 2*pi*300;
    end
    if b == 4
        w = 2*pi*600;
    end
    if b == 5
        w = 2*pi*250;
    end
        
    v = v + 10*sin(w*t + (pi/2)*rand());
        
    
end