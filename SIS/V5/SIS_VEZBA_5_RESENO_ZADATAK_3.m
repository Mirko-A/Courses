% KURS SISTEMI I SIGNALI
%
% VEZBA 5: Furijeova transformacija
%
% PRIMENA FURIJEOVE TRANSFORMACIJE U ANALIZI SISTEMA
%
syms y(t) 
syms t real
disp ('Treci zadatak:');
% Nalazenje odziva sistema resavanjem RUI u vremenskom domenu
u = cos(2*3.14*2*t)+0.5*cos(2*3.14*8*t)+0.5*cos(2*3.14*200*t)
Du = diff(u);
Dy=diff(y);
D2y=diff(y,2);
resenje1=simplify(dsolve(D2y+3.93045*Dy+2499.0*y==3.93045*Du,y(0)==0, Dy(0)==0))

% Nalazenje odziva koriscenjem Furijeove transformacije
syms w G_w % ovo je oznaka za G(w), sliku od g(t)
slika_prvog_izvoda_g=simplify(j*w*G_w)
slika_drugog_izvoda_g=simplify((j*w)^2*G_w)
slika_pobude=fourier(dirac(t))
slika_prvog_izvoda_pobude=simplify(j*w*slika_pobude)
leva_strana_RUI=collect(slika_drugog_izvoda_g+3.93045*slika_prvog_izvoda_g+2499.0*G_w,'G_w')
desna_strana_RUI=3.93045*slika_prvog_izvoda_pobude

% Odredjivanje prenosne karakteristike
prenosna_karakteristika = solve (leva_strana_RUI==desna_strana_RUI,G_w)
% Amplitudska karakteristika izrazena u decibelima
amplitudska_karakteristika = abs (prenosna_karakteristika);
amplitudska_karakteristika_db = 20*log10(amplitudska_karakteristika);
% Fazna karakteristika izrazena u stepenima
fazna_karakteristika = 180/pi*atan (imag(prenosna_karakteristika)/real(prenosna_karakteristika));
% Crtanje amplitudske i fazne karakteristike
subplot (2, 1, 1), fplot(amplitudska_karakteristika_db,[0,1000]);
axis([0 1000 -90 0])
set(gca,'XScale','log');
title ('Amplitudska karakteristika sistema');
xlabel('\omega [rad/s]')
ylabel('20*log_1_0(|G(\omega)|) [dB]')
subplot (2, 1, 2), fplot(fazna_karakteristika,[0,1000]);
axis([-1000 1000 -90 90])
set(gca,'XScale','log');
title ('Fazna karakteristika sistema');
xlabel('\omega [rad/s]')
ylabel('arg(|G(\omega)|) [stepeni]')

% Racunanje odziva sistema na ulazni signal koriscenjem amplitudske i fazne
% karakteristike
% Vrednost amplitudske i fazne karakteristike na ucestanosti prve komponente iz
% ulaznog signala
w = 2*3.14*2;
amplituda_1 = eval (amplitudska_karakteristika)
faza_1 = eval (fazna_karakteristika)
% Vrednost amplitudske i fazne karakteristike na ucestanosti druge komponente iz
% ulaznog signala
w = 2*3.14*8;
amplituda_2 = eval (amplitudska_karakteristika)
faza_2 = eval (fazna_karakteristika)
% Vrednost amplitudske i fazne karakteristike na ucestanosti trece komponente iz
% ulaznog signala
w = 2*3.14*200;
amplituda_3 = eval (amplitudska_karakteristika)
faza_3 = eval (fazna_karakteristika)

% Izlazni signal sistema racunat na osnovu amplitudske i fazne
% karakteristike
resenje2 = amplituda_1*cos(2*3.14*2*t+faza_1)+amplituda_2*0.5*cos(2*3.14*8*t+faza_2)+amplituda_3*0.5*cos(2*3.14*200*t+faza_3)

figure
% Crtanje ulaznog signala
u = cos(2*3.14*2*t)+0.5*cos(2*3.14*8*t)+0.5*cos(2*3.14*200*t);
subplot(3,1,1)
ezplot(u,[0,2.4]);
axis([0 2.4 -3 3])
xlabel('t (sec)')
ylabel('u(t)')
grid on
title('Ulazni signal')
% Crtanje resenja dobijenog resavanjem RUI u vremenskom domenu
subplot(3,1,2)
ezplot(eval(resenje1),[0,2.4]);
axis([0 2.4 -2 2])
xlabel('t (sec)')
ylabel('y(t)')
grid on
title('Resenje dobijeno u t-domenu')
% Crtanje resenja dobijenog na osnovu amplitudske i fazne karakteristike
subplot(3,1,3)
ezplot(resenje2,[0,2.4]);
axis([0 2.4 -2 2])
xlabel('t (sec)')
ylabel('y(t)')
grid on
title('Resenje dobijeno koriscenjem amplitudske i fazne karakteristike')