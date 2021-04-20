% KURS SISTEMI I SIGNALI
% RACUNARSKA VEZBA 2: LVN SISTEMI U KONTINUALNOM VREMENU
%
% jednacine stanja sistema (numericke matrice A,B,C,D, 
% za promenjive stanja x1(t) i x2(t) i izlaz y(t))
A=[0 1 ; -1/5 -1/3];B=[0;1/15];C=[1 0];D=[0];
sistem=ss(A,B,C,D) % koriscenje naredbe ss, state-space
%
% kada je sistem numericki, naredba ss2tf (from state-space to transfer-function)
% vraca koeficijente operatorskog polinoma koji deluje na izlaz 
% (leva strana RUI u vremenskom domenu),
% i operatorskog polinoma koji deluje na ulaz 
% (desna strana RUI u vremenskom domenu)
%
[rui_desna_strana,rui_leva_strana]=ss2tf(A,B,C,D)
%
% pocetne uslove za resavanje RUI moramo sami izracunati
%
% pocetni uslovi integratora (operator D^-1)
x1_0_=1;x2_0_=1;
%
% ako je pobuda w(t)=h(t), w(0_)=0, w'(0_)=0
w0_=0; w0_izvod=0;
%
% prvi pocetni uslov za RUI
y0_=C*[x1_0_;x2_0_]+D*[w0_]
%
% drugi pocetni uslov za RUI
y0_izvod=C*(A*[x1_0_;x2_0_]+B*[w0_])+D*[w0_izvod]
%
syms t y w % odziv y(t) i pobuda w(t)
% w=heaviside(t), Dw=dirac(t), D2w=dirac(1,t);
%
% zameni izracunate pocetne uslove u izraz za pu, konkatenacija stringova
% (tacku 0_=limes(t) kada t->0 sa leve strane, aproksimiramo sa 0_=-0.0000001;
% 0_ je oznaka za trenutak neposredno pre ukljucenja generatora):
%
syms y(t)
Dy=diff(y);
D2y=diff(y,2);
resenje=dsolve(D2y+0.3333*Dy+0.2*y==0*dirac(1,t)+0*dirac(t)+0.0667*heaviside(t),...
    y(-0.0000001)==y0_,Dy(-0.0000001)==y0_izvod);
fplot(resenje,[-1,40]);
axis([-1 40 0 1])
title('Ukupni odziv sistema')

%
% naredba step: jedinicni odziv sistema (ili Indiciona f-ja sistema), 
% tj. odziv kada je pobuda w(t)=heaviside(t) i pocetni uslovi x(0_)=0:
%
f2=figure(2);
subplot(4,2,1)
step(sistem,40) % 3 je T_max dokle ce nacrtati grafik
%
% ovo gore je vektor odbiraka indicione f-je, a ako hocemo da je izracunamo
% analiticki oblik indicione f-je preko simbolickog racuna u Matlab-u:
%
syms ind(t)
assume(t>0);
Dind=diff(ind);
D2ind=diff(ind,2);
ind=dsolve(D2ind+0.3333*Dind+0.2*ind==0*dirac(1,t)+0*dirac(t)+0.0667*heaviside(t),...
    ind(-0.0000001)==0, Dind(-0.0000001)==0);
subplot(4,2,2)
fplot(ind,[-1,40]);
axis([-1 40 0 0.5])
title('Indiciona f-ja')
assume(t,'clear')
%
% naredba impulse: impulsni odziv sistema (ili Grinova f-ja sistema), 
% tj. odziv kada je pobuda w(t)=dirac(t) i pocetni uslovi x(0_)=0:
%
subplot(4,2,3)
impulse(sistem,40)
%
% ovo gore je vektor odbiraka Grinove f-je, a ako hocemo da je izracunamo
% simbolicki (tacku 0_=limes(t) kada t->0 sa leve strane aproksimiramo sa -0.0000001):
%
syms g(t)
Dg=diff(g);
D2g=diff(g,2);
grin=dsolve(D2g+1/3*Dg+0.2*g==1/15*dirac(t),...
    g(-0.0000001)==0, Dg(-0.0000001)==0)
subplot(4,2,4)
fplot(grin,[-1,40]);
axis([-1 40 -0.05 0.1])
title('Grinova f-ja (ne moze da nacrta njen singularni deo)')
%
% da li je izvod indicione f-je = grinovoj f-ji?
%
% jeste (mora biti)
%
% naredba initial: odziv usled akumulisane energije, 
% ili odziv na nenulte pocetne uslove, 
% w(t)=0 i pocetni uslovi x(0_)!=0:
%
subplot(4,2,5)
initial(sistem,[x1_0_,x2_0_])
%
% odziv na proizvoljnu pobudu
%
% naredba gensig: generise signal; 
% na raspolaganju su 'sin' - Sine wave, 'square' - Square wave, 'pulse' - Periodic pulse.
%
[pravougaona_povorka,tt] = gensig('square',5,10,0.05); 
%
subplot(4,2,6)
plot(tt,pravougaona_povorka)
title('Povorka pravougaonih impulsa')
axis([0 10 -1 40])
%
% naredba lsim: simulacija ponasanja linearnog sistema; mogu se ukljuciti i
% nenulti pocetni uslovi itd. (pogledati za svaku naredbu help i primere)
subplot(4,2,8)
lsim(sistem,pravougaona_povorka,tt)
title('Odziv na povorku delta impulsa')
%
% odziv na proizvoljnu pobudu, koriscenjem konvolucije i grinove f-je:
% odziv na novu pobudu je y_novo(t)=grin(t)*w_novo(t), 
% gde je * oznaka za konvoluciju
%
% neka je nova pobuda w_novo=sin(t)*heaviside(t)
%
w_novo=sin(t)*heaviside(t);
syms tau % nema promenjiva po kojoj ce se integraliti
y_novo(t)=simplify(int(subs(grin,t,tau)*subs(w_novo,t,t-tau),tau,-inf,inf))
subplot(4,2,7)
fplot(@(t)y_novo(t),[1,10*pi]);
axis([-1 10*pi -0.5 0.5])
title('Odziv na sin(t)h(t), racunat preko konv.')
%
% naredba ltiview: prikaz raznih funkcija LTI sistema (max. 6 crteza istovremeno)
% pogledati help i Matlab-ovu dokumentaciju!
%
ltiview(sistem)
ltiview({'step';'impulse';'pzmap';'bode';'nyquist';'nichols'},sistem)