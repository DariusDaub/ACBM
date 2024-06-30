%%% Defaultwerte
set(0,'defaulttextfontname','Helvetica','defaultaxesfontname','Helvetica');
set(0,'defaulttextfontsize',16,'defaultaxesfontsize',14);
set(0,'defaultlinelinewidth',1,'defaultlinemarkersize',10);
%
%% Kapitel 10: Matrizeninversion, Pivotisierung, LU-Zerlegung...%%
clear
clc
close all
%% Aufgabe 1 %%
A = [1 2 3; 4 5 6; 7 8 0];
b = [1 2 3]';

% rrefmovie ([A, b, eye(3,3)])

%% Aufgabe 2 %%

x = A\b;
sym(x)

A_inv = inv(A);
sym(A_inv)

%% Aufgabe 3 %%
A_s = [1 2 3; 4 5 6; 7 8 9];

rrefmovie([A_s, b, eye(3,3)])

%% Aufgabe 4 %%
[L, U] = lu(A);
L_det = det(L);
U_det = det(U);

det_A = U(1,1) * U(2,2) * U(3,3);

%% Aufgabe 5 %%
A_LU = L*U;
A - A_LU
A_inv_LU = inv(U)*inv(L);
A_inv - A_inv_LU

%% Aufgabe 6 %%
y = L\b;
x2 = U\y;

%% Aufgabe 7 %%
% A_chol = chol(A);

%% Aufgabe 8 %%
P = [5 7 4; 6 11 2; 3 2 6];
p = ispositivedefinite(P);

% P_chol = chol(P); ("Matrix must be postive definite")

%% Aufgabe 9 %%
P_D = (P + P')/2;
P_D_chol = chol(P_D);
P_D_chol_trans = P_D_chol';
P_D2 = P_D_chol_trans * P_D_chol;
P_D - P_D2

%% Aufgabe 10 %%
[Q, R] = qr(A);
Q_orth = isorthogonal(Q);

%% Aufgabe 11%%
[Q_s, R_s] = qr(A_s);

