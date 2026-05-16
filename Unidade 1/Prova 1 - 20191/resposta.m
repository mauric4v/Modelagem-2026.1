clc
clear
close all

a = 1000;
centros = -10:0.05:10;
cont = zeros(1,length(centros));

for i = 1:a
  [Vm] = placa_de_aquisicao_3(0);
   R = Vm-centros;
  [aux idc] = min(abs(R));

  cont(idc) = cont(idc)+1;
end
prob =cont./a;

%plot(Vm)
plot(centros,prob);
prob_ideal = 0*prob;

for i=1:length(centros)
  if centros(i) >= -0.5 && centros(i) <= 0.5
    prob_ideal(i) = 1/21;
  endif
endfor
hold on
plot(centros,prob_ideal,'r');
%1/21

eqm = mean((prob-prob_ideal).^2)
%1 = 5.5245e-05
%2= 4.1819e-06
