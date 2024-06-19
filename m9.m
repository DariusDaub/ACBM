%%% Defaultwert
set(0,'defaulttextfontname','Helvetica','defaultaxesfontname','Helvetica');
set(0,'defaulttextfontsize',16,'defaultaxesfontsize',14);
set(0,'defaultlinelinewidth',1.5,'defaultlinemarkersize',10);

%% Kapitel 9: Matrizeneigenschaften %%
clear
clc
close all

%% Aufgabe 1 %%

Z3 = zeros(3,3);
Z3B = zeros(3,4);

zerosA = iszero(Z3);
zerosB = iszero(Z3B); 

Z3_eps= zeros(3,3); 
Z3_eps(2,3) = eps;
zeros_eps = iszero(Z3_eps);

%% Aufgabe 2 %%

A = [1 2 3
    4 5 6
    7 8 9];
sq_A = issquare(A);

AA = cat(2,A,A);
sq_AA = issquare(AA);

%% Aufgabe 3 %%
D = diag(A);
AD = diag(D);
dg = isdiagonal(AD);

AD_2 = AD;
AD_2(1,3) = eps;
dg_2 = isdiagonal(AD_2);

%% Aufgabe 4 %%
sym_A = myissymmetric(A);
AAT = A * A';
sym_AAT = myissymmetric(AAT);
[V, D] = eig(AAT);
AAT_2 = (V * D * V')';
eq = AAT_2 - AAT; %auf Grund von Rundungen entstehen kleine Unterschiede

%% Aufgabe 5 %%
AI = [1i 0 0
    2i 3i 0
     0 0 0];
AC = A + AI;

AH = AC + AC';
sym_AH = myissymmetric(AH);
herm_AH = myishermetic(AH);
real_diag = isreal(diag(AH));
real_eig = isreal(eig(AH));

%% Aufgabe 6 %%
sing_A = issingular(A);
sing_Z3 = issingular(Z3);
sing_Z3_eps = issingular(Z3_eps);
sing_AD = issingular(AD);
sing_AC = issingular(AC);

%% Aufgabe 7 %%
O = 1/3*[2 -2 1
         1 2 2
         2 1 -2];
orth_O = isorthogonal(O);


%% Aufgabe 8 %%
U = [1/sqrt(2) 1/sqrt(2) 0
    1/sqrt(-2) -1/sqrt(-2) 0
    0 0 1i];
uni_U = isunitary(U);

%% Aufgabe 9 %%
orth_U = isorthogonal(U);
uni_O = isunitary(O);
det_U = det(U);
eig_U = eig(U);

%% Aufgabe 10 %%
PD = [5 7 4
      6 11 2
      3 2 6];
posdef = ispositivedefinite(PD);
