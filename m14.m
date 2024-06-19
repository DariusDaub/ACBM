%%% Defaultwerte
set(0,'defaulttextfontname','Helvetica','defaultaxesfontname','Helvetica');
set(0,'defaulttextfontsize',16,'defaultaxesfontsize',14);
set(0,'defaultlinelinewidth',1,'defaultlinemarkersize',10);
%
%% Kapitel 14: Numerische Lösung partieller Differenzialgleichungen %%
clear
clc
close all

%% Aufgabe 8 %%
m = 0;
x = linspace(0, 2*pi, 42);	
t = linspace(0, 2*pi, 42);	

sol = pdepe(m, 'pdexpde', 'pdexic', 'pdexbc', x, t);

%% Aufgabe 9 %%
u1 = sol(:, :, 1);	

figure(1)
surf(x, t, u1)	
title ('u1(x, t)','Interpreter','latex')	
xlabel ('Ort x',Interpreter='latex')	
ylabel ('Zeit t',Interpreter='latex')	
zlabel ('Auslenkung u',Interpreter='latex')	

%% Aufgabe 10 %%
figure(2)
plot(x, [u1(42,:); sin(x)])	
legend('numerische Lösung', 'analytische Lösung')

%% Aufgabe 11 %%
figure(3)
u2 = sol(:, :, 2);	
surf (x, t, u2)	
title ('u2 (x, t)',Interpreter='latex')	
xlabel ('Auslenkung x',Interpreter='latex')	
ylabel ('Zeit t',Interpreter='latex')	