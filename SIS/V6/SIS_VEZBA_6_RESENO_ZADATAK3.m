clc;
clear all;
close all;
%
% RESENJE ZADATKA 3
%
% Specifikacija filtra
n = 6;
Rp = 1;
Rs = 40;
Wn1 = 10000;
Wn2 = 12000;
Wn = [Wn1, Wn2];
type = 'bandpass';

w = 0 : 10 : 2*Wn2;
% Projektovanje analognog filtra koriscenjem Cebisevljeve aproksimacije prve
% vrste
[b_cheby1,a_cheby1] = cheby1(n,Rp,Wn, type,'s');
% Crtanje amplitudske  fazne karakteristike pomocu funkcije freqs
figure
h = freqs(b_cheby1,a_cheby1, w);
amplitudska_karakteristika = 20*log10(abs(h));
fazna_karakteristika = 180/pi*angle(h);
subplot(2,1,1), semilogx(w,amplitudska_karakteristika)
axis ([0 2*Wn2 -100 10]);
title (sprintf('Analogni filtar projektovan koriscenjem Cebisevljeve aproksimacije prve vrste\nAmplitudska karakteristika'));
grid on
subplot(2,1,2), semilogx(w,fazna_karakteristika)
axis ([0 2*Wn2 -180 180]);
title ('Fazna karakteristika');
grid on
% Projektovanje analognog filtra koriscenjem Cebisevljeve aproksimacije druge
% vrste
[b_cheby2,a_cheby2] = cheby2(n,Rs,Wn,type,'s');
% Crtanje amplitudske  fazne karakteristike pomocu funkcije freqs
figure
h = freqs(b_cheby2,a_cheby2, w);
amplitudska_karakteristika = 20*log10(abs(h));
fazna_karakteristika = 180/pi*angle(h);
subplot(2,1,1), semilogx(w,amplitudska_karakteristika)
axis ([0 2*Wn2 -100 10]);
title (sprintf('Analogni filtar projektovan koriscenjem Cebisevljeve aproksimacije druge vrste\nAmplitudska karakteristika'));
grid on
subplot(2,1,2), semilogx(w,fazna_karakteristika)
axis ([0 2*Wn2 -180 180]);
title ('Fazna karakteristika');
grid on
% Projektovanje analognog filtra koriscenjem Batervortove aproksimacije
[b_butter,a_butter] = butter(n,Wn,type,'s');
% Crtanje amplitudske  fazne karakteristike pomocu funkcije freqs
figure
h = freqs(b_butter,a_butter, w);
amplitudska_karakteristika = 20*log10(abs(h));
fazna_karakteristika = 180/pi*angle(h);
subplot(2,1,1), semilogx(w,amplitudska_karakteristika)
axis ([0 2*Wn2 -100 10]);
title (sprintf('Analogni filtar projektovan koriscenjem Batervortove aproksimacije\nAmplitudska karakteristika'));
grid on
subplot(2,1,2), semilogx(w,fazna_karakteristika)
axis ([0 2*Wn2 -180 180]);
title ('Fazna karakteristika');
grid on
% Projektovanje analognog filtra koriscenjem elipticke aproksimacije
[b_ellip,a_ellip] = ellip(n,Rp,Rs,Wn,type,'s');
% Crtanje amplitudske  fazne karakteristike pomocu funkcije freqs
figure
h = freqs(b_ellip,a_ellip, w);
amplitudska_karakteristika = 20*log10(abs(h));
fazna_karakteristika = 180/pi*angle(h);
subplot(2,1,1), semilogx(w,amplitudska_karakteristika)
axis ([0 2*Wn2 -100 10]);
title (sprintf('Analogni filtar projektovan koriscenjem elipticke aproksimacije\nAmplitudska karakteristika'));
grid on
subplot(2,1,2), semilogx(w,fazna_karakteristika)
axis ([0 2*Wn2 -180 180]);
title ('Fazna karakteristika');
grid on
% Definisanje ulaznog signala za potrebe Simulink simulacije
t = 0 : 0.00001 : 0.05;
u = cos(2*pi*1000*t)+0.5*cos(2*pi*1800*t)+0.25*cos(2*pi*3000*t);
u_sim = [t;u]';