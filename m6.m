%%% Defaultwerte
set(0,'defaulttextfontname','Helvetica','defaultaxesfontname','Helvetica');
set(0,'defaulttextfontsize',16,'defaultaxesfontsize',14);
set(0,'defaultlinelinewidth',1.5,'defaultlinemarkersize',10);

%% Kapitel 6: Optimierung, Identifikation %%
clear
close all
clc

%% Aufgabe 1 %%
d = 1/sqrt(2);
w0 = sqrt(2);
k = 2;

num = k * w0^2;
den = [1, 2*d*w0, w0^2];

sys_tf = tf(num,den);

t1 = 0:0.1:10;
verlauf = step(sys_tf,t1);

d1 = 1;
w01 = 1;
k1 = 1;
par = [d1, w01, k1];

Opt = fminsearch (@(par) kosten(par, verlauf), par); 	

d_opt = Opt(1);
w0_opt = Opt(2); 	
k_opt = Opt(3);
