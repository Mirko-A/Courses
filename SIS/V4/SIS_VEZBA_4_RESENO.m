% RESENJE ZADATKA ZA SAMOSTALAN RAD
%
H1_n=[1];
H1_d=[1 2];
H1=tf(H1_n,H1_d)
H2_n=[1];
H2_d=[1 1];
H2=tf(H2_n,H2_d)
H3_n=[1];
H3_d=[1 4];
H3=tf(H3_n,H3_d)
%
%pitati za cloop
[H2cloop_n, H2cloop_d]=cloop(H2_n, H2_d);
[H1H2cloop_n, H1H2cloop_d]=parallel(H1_n, H1_d, H2cloop_n, H2cloop_d);
[G_n, G_d]=feedback(H1H2cloop_n, H1H2cloop_d, H3_n, H3_d);
G=tf(G_n, G_d);
figure(2)
subplot(2,2,1)
impulse(G)
grid on
subplot(2,2,2)
pzmap(G)
sgrid
subplot(2,2,3)
bode(G)
grid on