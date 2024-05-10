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

faktor = t1/t2;

n = 10000;

faktor_heap = n^2/(n*log2 (n));

%% Aufgabe 8 %%
Menge = {'apfel', 'apfelmus', 'Apfel', '2 Äpfel', '11 äpfel',...
    'äpfel', 'banane'};
Menge_sortiert = sort(Menge);

Menge_char = char(Menge);
ASCII = double(Menge_char);

%% Aufgabe 9 %%
[Menge_sortiert, Indizes] = sort(Menge);

for i = 1 : length (Indizes)	
   	
    rang (Indizes(i)) = i;	
	
end	

[~,rank] = ismember(Menge,Menge_sortiert);

%% Aufgabe 10 %%
obst_char = Menge_char;

obst_char_sor = sort(obst_char);
obst_char_sor2 = sort(obst_char,2);

%% Aufgabe 11 %
[num, txt, raw] = xlsread("noten.xlsx");
Noten_sortiert = sortrows(num,1);
Noten_sortiert2 = sortrows(num,2);

%% Aufgabe 12 %

caos = {'Albert', 'Einstein', '1879'
    'Leonardo', 'da Vinci', '1452'
    'Carl Friedrich', 'Gauß', '1777'};

caos_NN = sortrows(caos,1);
caos_VN = sortrows(caos,2);
caos_GJ = sortrows(caos,3);

%% Aufgabe 13 %%

% Kompletten Datensatz	
caos(1,:)	
	
% Nur Nachname	
caos{1,2}	
	
% Nur 'stein'	
caos{1,2}(4:8)	

[n, m] = find (strcmp (caos, 'Einstein'))

% caos=='Einstein'

%% Aufgabe 14 %% 

fields = {'Vorname', 'Nachname', 'Geburtsjahr'};
caos_struct = cell2struct(caos, fields, 2);

caos_struct(1)	
caos_struct(1).Nachname	
caos_struct(1).Nachname(4:8)	
