function [y,t] = caldeira(u,tamos)

    t = 0:tamos:tamos*length(u)-tamos;
    wn = 0.2;
    zeta = 1.3;
    ganho = 3;
    H = tf(ganho*wn^2,[1 2*zeta*wn wn^2]);
    y = lsim(H,u,t)';
    
    if max(y) > 200
        disp('!!!!!!!LIMITE DE PRESSÃO DA CALDEIRA ULTRAPASSADO!!!!!!!')
        disp('!!!!!!!LIMITE DE PRESSÃO DA CALDEIRA ULTRAPASSADO!!!!!!!')
        disp('!!!!!!!LIMITE DE PRESSÃO DA CALDEIRA ULTRAPASSADO!!!!!!!')
        disp('!!!!!!!LIMITE DE PRESSÃO DA CALDEIRA ULTRAPASSADO!!!!!!!')
        disp('!!!!!!!LIMITE DE PRESSÃO DA CALDEIRA ULTRAPASSADO!!!!!!!')
        disp('!!!!!!!LIMITE DE PRESSÃO DA CALDEIRA ULTRAPASSADO!!!!!!!')
        disp('SISTEMA DE PROTEÇÃO ATIVADO')
        disp('DESLIGAMENTO DE SEGURANÇA: CALDEIRA DESLIGADA')
        error('LIMITE DE PRESSÃO DA CALDEIRA ULTRAPASSADO ---> DESLIGAMENTO DE SEGURANÇA: CALDEIRA DESLIGADA')
    else
        y = y + randn(1,length(y))*5;
    end

end