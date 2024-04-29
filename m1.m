%%% Defaultwerte %%%
set(0,'defaulttextfontname','Helvetica','defaultaxesfontname','Helvetica');
set(0,'defaulttextfontsize',20,'defaultaxesfontsize',16);
set(0,'defaultlinelinewidth',2,'defaultlinemarkersize',10);

%% KAPITEL 1: INTERPOLATIONSVERFAHREN %%
clear 
close all

%% AUFGABE 1 %%
u = 0:10;
l = length(u);
y = sin(u);


%% AUFGABE 2 %%
uu = 0:0.1:10;
ll = length(uu);
yy = sin(uu);

%% AUFGABE 3 %%
yl = interp1(u,y,uu,"linear");
yl2 = interp1(uu,yy,'linear');

%% AUFGABE 4 %%
s = size(yl);

%% AUFGABE 5 %%
a = polyfit(u,y,3);
yk = polyval(a, uu);
ys = spline(u,y,uu);

figure(1)
plot(u,y,'b*'), hold on
plot(uu,yy,'r'), hold on
plot(uu,yl,'c'), hold on
plot(uu,yl2,'y'), hold on
plot(uu,yk, 'g'), hold on
plot(uu,ys,'Color',"#7E2F8E"), hold on

%% AUFGABE 6 %%
figure(2)
ezplot('3 * x.^2 + 1 + 1/(pi^4) * log((pi - x).^2)',[0 10])


%% AUFGABE 7 %%
figure(3)
ezplot('3 * x.^2 + 1 + 1/(pi^4) * log((pi - x).^2)',[pi-2e-1 pi+2e-1])



