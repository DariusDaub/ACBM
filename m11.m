%%% Defaultwerte
set(0,'defaulttextfontname','Helvetica','defaultaxesfontname','Helvetica');
set(0,'defaulttextfontsize',16,'defaultaxesfontsize',14);
set(0,'defaultlinelinewidth',1,'defaultlinemarkersize',10);
%
%% Kapitel 11: Singulärwert-Zerlegung %%
clear
clc
close all
%% Aufgabe 1 %%
A = rand(4,3);
r = rank(A);

%% Aufgabe 2 %%
[U, S, V] = svd(A,"econ");

%% Aufgabe 3 %%
A_svd = U * S * V';
A_diff = A - A_svd;
any (any (abs (A_diff) > 1e-12))

U_norm = U*U';  %-> nicht Zeilenorthonormal
U_norm2 = U'*U; %-> Spaltenorthonormal

V_norm = V*V'; %-> Zeilenorthonormal
V_norm2 = V'*V; %-> Spaltenorthonormal

%% Aufgabe 4 %%

B = rand(6,6);
[U_b, S_b, V_b] = svd(B,"econ");

Prod = V_b * diag(1./diag(S_b)) * U_b';
B_inv = inv(B);
diff = B_inv - Prod;

B*B_inv

B_norm = norm(B);
Sing_max = max(S_b,[],'all');
Sing_max - norm(B)

c = Sing_max/S_b(6,6);
c - cond(B)

%% Aufgabe 5 %%
T = [1 2 3; 4 5 6; 7 8 9];
rg = rank(T);
Det = det(T);
Kon = cond(T);
[U_t, S_t, V_t] = svd(T,"econ");

%% Aufgabe 6 %%
T_inv_1 = svd_inv(T);
T_inv_2 = pinv(T);

T_inv_1 - T_inv_2

%% Aufgabe 7 %%
P = T * T_inv_1;
P2 = T_inv_1 * T;

T*T_inv_1*T - T
T_inv_1*T*T_inv_1 - T_inv_1

(T*T_inv_1)' - T*T_inv_1
(T_inv_1*T)' - T_inv_1*T

%% Aufgabe 8 %%
Z = null(T);

V_t(:,3)./null(T) %V und der Nullvektor sind linear abhängig

T*null(T)

%% Aufgabe 9 %%
Q = orth(T);
rank([U_t(:,[2,3]),Q])
x = rand(3,1);
rank ([T*x, Q])

%% Aufgabe 10 %%
b = rand*Q(:,1) + rand*Q(:,2);	

y = mldivide(T,b);

norm(T*y -b)

norm(y)
y = pinv (T)*b	
(T*y - b)
norm(y)

%% Aufgabe 11 %%
y1 = y + 0.1*null(T);
y2 = y - 0.1*null(T);

norm(T*y1 -b)
norm(T*y2 -b)

norm(y1)
norm(y2)

%% Aufgabe 12 %%
b1 = rand(3,1)
y2 = pinv(T)*b
norm(T*y2 - b1)

y2 = y2 + rand(3,1);
norm(T*y2 -b1)

%% Aufgabe 13 %%
C  = rand(6,6);
C(4,:) = 0;

[U_c, S_c, V_c] = svd(C,"econ");
Rang_C = rank(C);

%% Aufgabe 14 %% 
C(4,:) = 2*C(2,:);
Rang_C = rank(C);
[U_c, S_c, V_c] = svd(C,"econ");

%% Aufgabe 15 %%
C(4,:) = 2*C(2,:) + 4*C(3,:);
[U_c, S_c, V_c] = svd(C,"econ");
Rang_C = rank(C);

%% Aufgabe 16 %%
C(6,:) = 3*C(1,:);
[U_c, S_c, V_c] = svd(C,"econ");
Rang_C = rank(C);

%% Aufgabe 17 %%
[U_1, S_1, V_1] = svd(C');

%% Aufgabe 18 %%
s = svd(C);

sort(sqrt (eig (C*C'))) - sort(s)

%% Aufgabe 19 %%
syms x1 x2

g1 = 0.78*x1 +  0.563*x2 - 0.217;
g2 = 0.913*x1 + 0.659*x2 - 0.254;

[x1,x2] = solve(g1,g2);

%% Aufgabe 20 %%
a = [0.78, 0.563; 0.913, 0.659];
b = [0.217; 0.254];

cond(a)

format long

[U_20, S_20, V_20] = svd(a);

x = a\b
y = inv(a)*b

%% Aufgabe 21 %%

x1 = [0.999; -1.001];

norm(a*x1 -b)

x2 = [0.341; -0.087];

norm(a*x2 -b)