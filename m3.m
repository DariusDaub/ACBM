%%% Defaultwerte
set(0,'defaulttextfontname','Helvetica','defaultaxesfontname','Helvetica');
set(0,'defaulttextfontsize',20,'defaultaxesfontsize',16);
set(0,'defaultlinelinewidth',2,'defaultlinemarkersize',10);

%% KAPITEL 3: QUATERNIONEN %%
clear
close all

%% Aufgabe 1 %%

q1 = [1 2 3 4];

q1_ = quatcon(q1);

%% Aufgabe 2 %%

p = quadprod(q1,q1_);

%% Aufgabe 3 %%

Null = [0 0 0];
r = [3 3 3];

figure(1)
arrow3(Null, r, 'b'), grid on

%Erste Drehung
alpha = 2*pi/3;
n = [0 0 1];
rq = [0 3 3 3];

r1 = rotquat(n, alpha, rq);
r1(1) = [];


figure(2)
arrow3(Null, r1, 'b'), grid on

%Zweite Drehung
n2 = [0 0 -1];

r2 = rotquat(n2,alpha,rq);
r2(1) = [];

%Dritte Drehung
n3 = [0 0 4];

r3 = rotquat(n3,alpha,rq);
r3(1) = [];

figure(3)
axis([-4 4 -4 4 -4 4])
daspect([1 1 1]), view([-40,24])
hold on, grid on
arrow3(Null, n, '_g')
arrow3(Null, n2, '_r')
arrow3(Null, r1, 'g')
arrow3(Null, r, 'b')
arrow3(Null, r2, 'r')
arrow3(Null, r3, 'v')
hold off

%% Aufgabe 4  %%

alpha2 = pi;
n4 = [1 0 0];

r4 = quatrot(n4, alpha2, r);


figure(4)
axis([-4 4 -4 4 -4 4])
daspect([1 1 1]), view(45,45)
hold on, grid on
arrow3(Null, r4', 'b')
arrow3(Null, r, 'g')
arrow3(Null, n4, '_b')
hold off

qd = [cos(alpha2/2)  n4(1)*sin(alpha2/2)  n4(2)*sin(alpha2/2)  n4(3)*sin(alpha2/2)];

M1 = [qd(1)^2+qd(2)^2-qd(3)^2-qd(4)^2 2*(qd(2)*qd(3) - qd(1)*qd(4)) 2*(qd(1)*qd(3) + qd(2)*qd(4))];
M2 = [2*(qd(1)*qd(4) + qd(2)*qd(3)) qd(1)^2-qd(2)^2+qd(3)^2-qd(4)^2 2*(qd(3)*qd(4) - qd(1)*qd(2))];
M3 = [2*(qd(2)*qd(4) - qd(1)*qd(3)) 2*(qd(1)*qd(2) + qd(3)*qd(4)) qd(1)^2-qd(2)^2-qd(3)^2+qd(4)^2];

M = cat(1,M1, M2, M3);
M_T = M.';

r_T = M_T * r';

M_inv = inv(M);

r_inv = M_inv * r';

%% Aufgabe 5 %%

r5 = [42 42 42];
n5 = [42 42 -42];
alpha3 = 2*pi/3;
aplha4 = -2*pi/3;

r_5 = quatrot(n5, alpha3, r5);

figure(5)
arrow3(Null,r_5','b')



%% Aufgabe 6 %%
E1 = [0.5 0.5 -0.5; -0.5 0.5 -0.5; -0.5 0.5 0.5; 0.5 0.5 0.5;...
    -0.5 -0.5 0.5; 0.5 -0.5 0.5; 0.5 -0.5 -0.5; -0.5 -0.5 -0.5];

nb = 1;

quader(E1,nb);

%% Aufgabe 7 %%

n_x = [1 0 0];
n_y = [0 1 0];
n_z = [0 0 1];

alpha_7 = 45/180*pi;

E1_x = quatrot(n_x,alpha_7,E1)';
E1_y = quatrot(n_y,alpha_7,E1)';
E1_z = quatrot(n_z,alpha_7,E1)';

nb2 = 0;

quader(E1_x,nb2)
quader(E1_y,nb2)
quader(E1_z,nb2)

%% Aufgabe 8 %%

E8 = E1 + ones(8,3);

quader(E8,nb)

alpha_x = 90/180*pi;
alpha_y = 90/180*pi;
alpha_z = 180/180*pi;

E8_x = quatrot(n_x,alpha_x,E8)';
E8_y = quatrot(n_y,alpha_y,E8)';
E8_z = quatrot(n_z,alpha_z,E8)';

quader(E8_x,nb2)
quader(E8_y,nb2)
quader(E8_z,nb2)

%% Aufgabe 9 %%

quader(E8,nb)

n_diag = [1.5 1.5 1.5];
alpha9 = 120/180*pi;

E9 = quatrot(n_diag,alpha9,E8)';

figure(10)
axis([-4 4 -4 4 -4 4])
daspect([1 1 1]), view(45,45)
hold on, grid on
arrow3(Null, n_diag, 'b')

quader(E9,nb2)

