%%% Defaultwerte
set(0,'defaulttextfontname','Helvetica','defaultaxesfontname','Helvetica');
set(0,'defaulttextfontsize',16,'defaultaxesfontsize',14);
set(0,'defaultlinelinewidth',1,'defaultlinemarkersize',10);
%
%% Kapitel 13: Partielle Differenzialgleichungen %%
clear
clc
close all

%% Aufgabe 3 %%

syms t x

u = (sin(x+t) + sin(x-t))/2;

delta = diff(diff(u,t),t) - diff(diff(u,x),x);

%% Aufgabe 4 %%

figure(1)
ezsurf(u,[0 2*pi 0 2*pi])

set(gca, 'ydir', 'reverse')

%% Aufgabe 5 %%

figure(2)
for i=1 : 100
    t = (i-1)/100 * 2 * pi;
    u = (sin(x+t) + sin(x-t))/2;
    ezplot(u,[0 2*pi])
    ylim([-1 1])
    frame(i) = getframe;
end

%% Aufgabe 6 %%
movie(frame,3,30)

v = VideoWriter('saite.avi');
v.Quality = 100;
v.FrameRate = 60;
open(v);
writeVideo(v,frame);
close(v);

%% Aufgabe 8 %%

syms t x y

u(x,y,t) = sin(pi*x)*sin(pi*y)*cos(pi*t);

u1 = diff(diff(u,x),x);
u2 = diff(diff(u,y),y);
u3 = diff(diff(u,t),t);

delta2 = u3 - (u1+u2)/2;

%% Aufgabe 9 %%
figure(3)
for i=1 : 100
    t = (i-1)/100*2;
    u2 = subs(u);
    ezsurf(u2,[-1 1 -1 1])
    zlim([-1 1])
    drawnow
end


