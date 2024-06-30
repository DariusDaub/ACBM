%% Kapitel 16: Randwertprobleme %%
clear
close all

%% Aufgabe 1 %%

DGL = 'D2x + Dx + x = 3';

LSG = dsolve(DGL, 'x(0)=42', 'Dx(0)=0');

ezplot(LSG, [0, 10]);

%% Aufgabe 2 %%

syms t

limit(LSG, t, inf)

vpa(subs(LSG, t, 10), 10)

%% Aufgabe 6 %%

[t,y] = ode45 (@randwertproblem_dgl, [0, 10], [42, 0]);
hold on
plot(t,y(:,1),'y--')
plot(t,y(:,2))
axis auto
hold off

%% Aufgabe 7 %%

%% Aufgabe 8 %%

solinit = bvpinit(linspace(0, 10), [10, 10]);

%% Aufgabe 9 %%

%% Aufgabe 10 %%

sol = bvp4c(@randwertproblem_dgl, @anfangswertproblem_bc, solinit);

plot(sol.x, sol.y)

%% Aufgabe 11 %%

options = bvpset("Stats", "on");

%% Aufgabe 12 %%

sol = bvp4c(@randwertproblem_dgl, @randwertproblem_bc, solinit, options);

plot(sol.x, sol.y)

%% Aufgabe 13 %%

solinit = bvpinit(linspace(0, 10), [0, 0]);
sol = bvp4c(@randwertproblem_dgl, @randwertproblem_bc, solinit, options);

%% Aufgabe 14 %%

sol = bvp4c(@randwertproblem_dgl, @randwertproblem_bc, solinit, options);

plot(sol.x, sol.y)
sol.yp(1,1)


