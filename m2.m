%%% Defaultwerte
set(0,'defaulttextfontname','Helvetica','defaultaxesfontname','Helvetica');
set(0,'defaulttextfontsize',20,'defaultaxesfontsize',16);
set(0,'defaultlinelinewidth',2,'defaultlinemarkersize',10);

%% KAPITEL 2: Mehrdimensionale Interpolation %%
clear
close all

%% AUFGABE 1 %%
figure(1)
peaks(25)

figure(2)
yp = peaks(7);
surf(yp), title('7 x 7 Peaks-Funktion', Interpreter='latex')

%% AUFGABE 2 %%
u1 = -3:1:3;
u2 = u1';
uu1 = -3:0.25:3;
uu2 = uu1';
yc = interp2(u2,u1,yp,uu2,uu1,'cubic');

figure(3)
surf(yc), 
title('Kubischer Interpolation', Interpreter='latex')

%% AUFGABE 3 %%
yn = interp2(u2,u1,yp,uu2,uu1,'nearest');

figure(4)
surf(yn),
title('Nearest-Neighbor-Interpolation', Interpreter='latex')