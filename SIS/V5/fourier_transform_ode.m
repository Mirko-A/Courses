syms y(t) 
syms t real
% 
Dy = diff(y);
D2y = diff(y,2);
u = cos(t);
y_homogeno=simplify(dsolve('D2y-2*Dy+y=0'))
%
% 
syms w Y_w % 
slika_prvog_izvoda_y=simplify(j*w*Y_w);
slika_drugog_izvoda_y=simplify((j*w)^2*Y_w);
slika_pobude=fourier(u);
slika_y_homogeno=fourier(y_homogeno)
leva_strana_RUI=collect(slika_drugog_izvoda_y-2*slika_prvog_izvoda_y+Y_w,'Y_w')
desna_strana_RUI=slika_pobude
% Odredjivanje prenosne karakteristike
Y_p = solve(leva_strana_RUI==desna_strana_RUI,Y_w)
%
Y_konacno = Y_p + slika_y_homogeno;
y_konacno = ifourier(Y_konacno)
