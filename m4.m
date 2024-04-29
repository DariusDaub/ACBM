%%% Defaultwerte
set(0,'defaulttextfontname','Helvetica','defaultaxesfontname','Helvetica');
set(0,'defaulttextfontsize',20,'defaultaxesfontsize',16);
set(0,'defaultlinelinewidth',2,'defaultlinemarkersize',10);

%% KAPITEL 4: Lagrange-Formalismus

%% Aufgabe 10 %%

verlauf_q1 = out.q1;
verlauf_q2 = out.q2;
verlauf1 = cat(2,verlauf_q1,verlauf_q2);
save('verlauf1.mat', 'verlauf1');

verlauf_q12 = out.q12;
verlauf_q22 = out.q22;
verlauf2 = cat(2,verlauf_q12,verlauf_q22);
save('verlauf2.mat', 'verlauf2');


