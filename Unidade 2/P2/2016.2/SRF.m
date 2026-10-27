function [t1 , t2 , t3] = SRF(v1,v2,tamos)

    if (length(v1) == length(v2) && length(tamos) == 1)
        t = 0:tamos:tamos*length(v1)-tamos;
          
        G1 = tf(0.007,[1 , 0.001]);
        t1 = lsim(G1,v1,t)';
        G2 = tf(0.023,[1 , 0.003]);
        t2 = lsim(G2,v2,t)';
        
        t1 = t1 + randn(1,length(t1))*5;
        t2 = t2 + randn(1,length(t2))*5;
        
        t3 = 0.9*t1 + 1.1*t2 - 0.01*t1.*t2;        

    else
        display('ERRO: O tamanho de v1 deve ser o mesmo de v2 e o período de amostragem deve ser um escalar')
    end

end