%%% Defaultwerte
set(0,'defaulttextfontname','Helvetica','defaultaxesfontname','Helvetica');
set(0,'defaulttextfontsize',16,'defaultaxesfontsize',14);
set(0,'defaultlinelinewidth',1.5,'defaultlinemarkersize',10);

%% Kapitel 7: Zufallszahlen, Sortieralgorithmen %%
clear
close all

%% Aufgabe 1 %%
Z(1) = 1000;

for i=1:5000
    Z(i+1) = zuf_falsch(Z(i));
end

plot(Z,'r.')

%% Aufgabe 2 %%

vek = Z(:,100:110);
vek2 = Z(:,3225:3235);

figure(1)
plot(vek,vek2);

[R,P] = corrcoef(vek,vek2);    

%% Aufgabe 3 %%

vek3 = Z(:,100:200);
vek4 = Z(:,725:825);

figure(2)
plot(vek3,vek4);
[R2,P2] = corrcoef(vek3,vek4);

%% Aufgabe 4 %%

for i = 1:length(vek3)
    if vek3(i) > vek4(i)
        vek4(i) = vek4(i) + 100000;
    end
end

figure(3)
plot(vek3,vek4)

%% Aufgabe 5 %%
untere_grenze = 1;
obere_grenze = 500;

for i = 1:10000
    zf(i) = zufallszahl(untere_grenze, obere_grenze);
end

figure(4)
hist(zf,500)

figure(5)
plot(zf,'r.')

%% Aufgabe 7 %%
tic
sortierte_Zahlen = sortieren(zf);
t1 = toc;

figure(5)
plot(sortierte_Zahlen);

D = diff(sortierte_Zahlen);
figure(6)
plot(D);

all(D >= 0)

tic
sortiert = sort(zf);
t2 = toc;

t1/t2




