clc
clear
close all
load('projeto_cheirinho_1.mat')
dados = [Ka Kb Ta Tb];
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
scatter(dados_2d(1:100,1),dados_2d(1:100,2),'r');
scatter(dados_2d(101:200,1),dados_2d(101:200,2),'g');
scatter(dados_2d(201:300,1),dados_2d(201:300,2),'b');
scatter(dados_2d(301:400,1),dados_2d(301:400,2),'c');
scatter(dados_2d(401:500,1),dados_2d(401:500,2),'m');
scatter(dados_2d(501:600,1),dados_2d(501:600,2),'y');

figure(2)
hold on
grid on
scatter3(dados_3d(1:100,1),dados_3d(1:100,2),dados_3d(1:100,3),'r');
scatter3(dados_3d(101:200,1),dados_3d(101:200,2),dados_3d(101:200,3),'g');
scatter3(dados_3d(201:300,1),dados_3d(201:300,2),dados_3d(201:300,3),'b');
scatter3(dados_3d(301:400,1),dados_3d(301:400,2),dados_3d(301:400,3),'c');
scatter3(dados_3d(401:500,1),dados_3d(401:500,2),dados_3d(401:500,3),'m');
scatter3(dados_3d(501:600,1),dados_3d(501:600,2),dados_3d(501:600,3),'y');
figure(3)
hold on
grid on
plot(dados_1d);
y = [zeros(100,1)*1 ;zeros(100,1)*2 ;zeros(100,1)*3 ;zeros(100,1)*4 ;zeros(100,1)*5 ;zeros(100,1)*6];
plot(dados_1d(1:100), y(1:100), '*', 'MarkerSize', 5,'color','r');
plot(dados_1d(101:200), y(101:200), '*', 'MarkerSize', 5,'color','g');
plot(dados_1d(201:300), y(201:300), '*', 'MarkerSize', 5,'color','b');
plot(dados_1d(301:400), y(301:400), '*', 'MarkerSize', 5,'color','c');
plot(dados_1d(401:500), y(401:500), '*', 'MarkerSize', 5,'color','m');
plot(dados_1d(501:600), y(501:600), '*', 'MarkerSize', 5,'color','y');
