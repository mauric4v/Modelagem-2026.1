function [Vm] = placa_de_aquisicao_1(Vr)
% Vr = tensão de referência. Valor real da tensão. Um único valor por vez.
% Vm = valor de tensão medido.
R = rand()*2-1;
Vm = Vr + R;
if Vm > 10, Vm = 10; end
if Vm < -10, Vm = -10; end

Vm = round(Vm*20)/20;


