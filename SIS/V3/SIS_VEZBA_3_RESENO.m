%SIS_VEZBA_3
%
% primer 1: resiti 
% a)u vremenskom domenu i 
% b) primenom unilateralne laplasove transformacije 
% diferencijalnu jednacinu
% y''(t)+5y'(t)+6y(t)=3w'(t)-2w(t), ako je w(t)=e^(-3t)h(t),
% uz pocetne uslove y(0_)=1, y'(0_)=1
%
% a) resenje u vremenskom domenu
%
syms y(t) s
Dy=diff(y);
D2y=diff(diff(y));
w(t)=exp(-3*t)*heaviside(t);
resenje=simplify(dsolve(D2y+5*Dy+6*y==3*dirac(t)-2*w,...
    y(-0.0000001)==1, Dy(-0.0000001)==-2))
subplot(2,1,1)

fplot(resenje,[-1,10]);
axis([-1 10 -0.2 1])
xlabel('t (sec)')
ylabel('y(t)')
grid on
title('Resenje dobijeno u t-domenu')
%
% b) resenje preko unilateralne Laplasove transformacije
%
syms Y_s % ovo je oznaka za Y(s), sliku od y(t)
slika_prvog_izvoda_y=simplify(s*Y_s-1)
slika_drugog_izvoda_y=simplify(s^2*Y_s-s*1-1)
slika_pobude=laplace(w)
leva_strana_RUI=collect(slika_drugog_izvoda_y+5*slika_prvog_izvoda_y+6*Y_s,'Y_s')
desna_strana_RUI=3-2*slika_pobude
%
% umesto diferencijalne jednacine po t (dsolve), resavamo algebarsku j-nu po s (solve):
%
resenje_laplas=simplify(solve((s^2+5*s+6)*Y_s-s-6==3-2/(s+3),Y_s))
resenje_nakon_povratka_u_t_domen=ilaplace(resenje_laplas)
subplot(2,1,2)
fplot(resenje_nakon_povratka_u_t_domen,[-1,10]);
axis([-1 10 -0.2 1])
xlabel('t (sec)')
ylabel('y(t)')
grid on
title('Resenje dobijeno primenom unilat. Laplasove transformacije')

% primer 2: pokazati
% na primeru x(t)=[1.5 - 2e^-t + 0.5e^-2t]h(t)
% da vaze tzv. prva i druga granicna teorema

syms t real
%
x(t)=(1.5-2*exp(-t)+0.5*exp(-2*t))*heaviside(t);
X_s=laplace(x);
x_nula_plus=limit(s*X_s,s,inf);
disp(x_nula_plus);
%
x_inf_1=limit(x,t,inf);
x_inf_2=limit(s*X_s,s,0);
disp(x_inf_1);
disp(x_inf_2);
