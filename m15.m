%%% Defaultwerte
set(0,'defaulttextfontname','Helvetica','defaultaxesfontname','Helvetica');
set(0,'defaulttextfontsize',16,'defaultaxesfontsize',14);
set(0,'defaultlinelinewidth',1,'defaultlinemarkersize',10);
%
%% Kapitel 15: Differenzial-algebraische Gleichungen %%
clear
clc
close all

%% Aufgabe 2 %%
global l m Fx Fy

l = 42;
m = 1;
Fx = 100;
Fy = 0;

t = linspace(0,10,100);
M = [1 0 0 0 0;
    0 1 0 0 0;
    0 0 1 0 0;	
    0 0 0 1 0;
    0 0 0 0 0];

options = odeset('Mass', M, 'RelTol', 1e-6);	

%% Aufgabe 3 %%
x0 = [0; 0; l; 0; 0];
[t, x] = ode15s(@gefesselte_masse_dae, t, x0, options);	

figure(1)
plot(t, x(:,[1,3]))	
xlabel('t',Interpreter='latex')	
legend('x_1 = x', 'x_2 = y')	
grid on	
	
figure(2)
plot(x(:,1), x(:,3));	
axis equal	
xlabel('$x_1 = x$',Interpreter='latex')	
ylabel('$x_2 = y$',Interpreter='latex')	
grid on	

%% Aufgabe 5 %%
options = odeset ( ...	
    'Mass', [], ...	
    'RelTol', 1e-6 ...	
    );	
x0 = [0; 0; l; 0;];
[t, x] = ode15s(@gefesselte_masse_ode, t, x0, options);

figure(3)
plot(t, x(:,[1,3]))	
xlabel('t',Interpreter='latex')	
legend('x_1 = x', 'x_2 = y')	
grid on	
	
figure(4)
plot(x(:,1), x(:,3));	
axis equal	
xlabel('$x_1 = x$',Interpreter='latex')	
ylabel('$x_2 = y$',Interpreter='latex')	
grid on	
