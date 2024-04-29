%%% Defaultwerte
set(0,'defaulttextfontname','Helvetica','defaultaxesfontname','Helvetica');
set(0,'defaulttextfontsize',16,'defaultaxesfontsize',14);
set(0,'defaultlinelinewidth',1.5,'defaultlinemarkersize',10);

%% Kapitel 5: Simulation dynamischer Systeme %%
clear
close all

%% Aufgabe 1 %%


d = 1/sqrt(2);
w0 = sqrt(2);
k = 2;

num = k * w0^2;
den = [1, 2*d*w0, w0^2];

sys_tf = tf(num,den);

[z,p,g] = tf2zp(num,den);

%% Aufgabe 2 %%

sys_zp = zpk(sys_tf);

[amat, bmat, cmat, dmat] = tf2ss(num,den);      

sys_ss = ss(amat, bmat, cmat, dmat);

figure(1)
pzmap(sys_tf)
text(-0.6,1,['numerator = ',mat2str(num)])
text(-0.6,0.5,['denumerator = ', mat2str(den)])

figure(2)
pzmap(sys_zp)
text(-0.6,0.75,['Pole = ', mat2str(p)])
text(-0.6,0.5,['Nullstellen = ', mat2str(z)])
text(-0.6,0.25,['Verstärkung = ', mat2str(g)])

%% Aufgabe 3 %%

figure(3)
pzmap(sys_ss)
text(-0.6,1,['A = ', mat2str(amat)])
text(-0.6,0.75,['B = ', mat2str(bmat)])
text(-0.6,0.5,['C = ', mat2str(cmat)])
text(-0.6,0.25,['D = ', mat2str(dmat)])

%% Aufgabe 4 %%

figure(4)
step(sys_tf), hold on
step(sys_ss)


%% Aufgabe 5 %%

t1 = 0:2:8;
t2 = 0:0.01:8;

figure(5)
step(sys_tf,t1), hold on
step(sys_tf,t2)

%% Aufgabe 6 %%

[wn, zeta, p2] = damp(sys_tf);


