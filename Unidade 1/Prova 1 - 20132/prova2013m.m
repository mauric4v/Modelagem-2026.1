clc
clear
close all

load ('dados_2611.mat');

t = 0:2:24;

figure(1)
subplot(211)
plot(t,r1);
hold on
plot(t,r2);
hold on
plot(t,r3);
hold on
plot(t,r4);
hold on
plot(t,r5);

r_medio = [ r1 r2 r3 r4 r5 ];
c_medio = [ c1 c2 c3 c4 c5 ];
t = [ t t t t t ];

Ar=[t'.^0];
nr=6;
Tr=24;
wr=2*pi/Tr;

for i = 1:nr
  Ar=[Ar, sin(t'.*wr.*i),cos(t'.*wr.*i)];
endfor

paramR = inv(Ar'*Ar)* Ar' * r_medio';
ymR = Ar*paramR
paramC = inv(Ar'*Ar)* Ar' * c_medio';
ymC = Ar*paramC;

subplot(212)
%scatter(t,r_medio)
%hold
plot(t(1:13),ymR(1:13),'r');
hold
plot(t(1:13),ymC(1:13),'b');
%%
%%
%%
%%figure(2)
%%subplot(211)
%%plot(t,c1);
%%hold on
%%plot(t,c2);
%%hold on
%%plot(t,c3);
%%hold on
%%plot(t,c4);
%%hold on
%%plot(t,c5);
%%
%%c_medio= (c1+c2+c3+c4+c5)./5
%%
%%Ac=[t'.^0];
%%
%%nc=6;
%%Tc=24;
%%wc=2*pi/Tc;
%%
%%for i = 1:nc
%%  %Ar=[Ar, t'.^i];
%%  Ac=[Ac, sin(t'.*wc.*i),cos(t'.*wc.*i)];
%%endfor
%%
%%paramC = inv(Ac'*Ac)* Ac' * c_medio';
%%ymC = Ac*paramC;
%%
%%subplot(212)
%%scatter(t,c_medio)
%%hold
%%plot(t,ymC,'r');
%%
load ('dados_2611b.mat');
figure(3)
teste = a3;

plot(t(1:13),ymR(1:13),'r');
hold on
plot(t(1:13),ymC(1:13),'b');
hold on
plot(t(1:13),teste,'m');
##hold on
##plot(t,a2);
##hold on
##plot(t,a3);
##hold on
##plot(t,a4);
##hold on
##plot(t,a5);
e_r = mean ((teste-ymR(1:13)').^2);
e_c = mean ((teste-ymC(1:13)').^2);
r=0;
c=0;
if e_r < e_c
  r=1;
  c=0;
else
  r=0;
  c=1;
end
r
c
