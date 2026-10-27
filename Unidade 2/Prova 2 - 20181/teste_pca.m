clc
clear
close all

clc
clear
close all
load('dados_iris.mat')
dados = [iris_treino1(:,1) iris_treino1(:,2) iris_treino1(:,3) iris_treino1(:,4)
         iris_treino2(:,1) iris_treino2(:,2) iris_treino2(:,3) iris_treino2(:,4)
         iris_treino3(:,1) iris_treino3(:,2) iris_treino3(:,3) iris_treino3(:,4)]
media = mean(dados,1);
std = std(dados,0,1);
dados_norm = (dados-media)./std;

[U,S,V] = svd(dados_norm);
dados_3d = dados_norm * V(:,1:3);
dados_2d = dados_norm *V(:,1:2);
dados_1d = dados_norm *V(:,1);
%plot
figure(1)
hold on
grid on
scatter3(dados_3d(:,1),dados_3d(:,2),dados_3d(:,3));
figure(2)
hold on
grid on
scatter(dados_2d(:,1),dados_2d(:,2));

