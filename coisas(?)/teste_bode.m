clc
clear
close all

w = logspace(-2, 3, 500);


s = 1j*w;
H = 4./(s+2).^2;

modulo = abs(H);
mdb = 20*log10(modulo);

figure(1)
semilogx(w, mdb)
grid on

fase = atan2(imag(H), real(H));
fase = angle(H);
figure(2)
semilogx(w, rad2deg(fase))
grid on;
