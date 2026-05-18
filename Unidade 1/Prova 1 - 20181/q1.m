clc;
clear;
close all;

load('cardiacos.mat');
A=[idade.^0];
nexp=6
for i = 1:nexp
  A=[A, idade.^i, colesterol.^i, pressao.^i,(idade.*colesterol).^i,(idade.*pressao).^i,(pressao.*colesterol).^i,(idade.*pressao.*colesterol).^i];
endfor

param = inv(A'*A)* A' * avaliacao; %pseudoinvera
ym = A*param;
ym = round(ym);

teste = avaliacao-ym;
erros = 0;
qtd_avaliacoes = length(avaliacao)
for i = 1:length(teste)
  if teste(i) != 0
    erros+=1;
    avaliacao_errada = i
  endif
endfor
erros
porcentam_acerto = ((qtd_avaliacoes-erros)/qtd_avaliacoes)*100

load('grupo_de_teste.mat');

A=[idade.^0];
for i = 1:nexp
  A=[A, idade.^i, colesterol.^i, pressao.^i,(idade.*colesterol).^i,(idade.*pressao).^i,(pressao.*colesterol).^i,(idade.*pressao.*colesterol).^i];
endfor

ym = A*param;
ym = round(ym)
