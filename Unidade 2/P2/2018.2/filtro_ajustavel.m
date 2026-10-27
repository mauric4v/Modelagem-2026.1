function [I] = filtro_ajustavel(V,P,tamos)
    % V = Sinal de tensão de entrada do filtro (em volts).
    % I = Valores de corrente medidos na saída do filtro (em ampéres).
    % P = porcentagem do valor de resistência do potenciômetro (de 0 a 100).
    % tamos = período de amostragem em segundos.

    if (P < 0 || P > 100)
        msgbox('Valor de P fora da faixa de 0 a 100 - Saída nula!')
        I = zeros(size(V))';
    elseif (length(tamos) ~= 1)
        msgbox('Tamos deve ser um escalar - Saída nula!')
        I = zeros(size(V))';
    else                   
        t = 0:tamos:tamos*length(V)-tamos;
        s = tf('s');
        R = 3; % 1 K Ohm
        L = 10; % 10 mH
        P = 10*(P/100);
        H = (1/L)/(s+((P+R)/L));
        I = lsim(H,V,t);
        I = I + randn(size(I))*0.15;
    end        

end