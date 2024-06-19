%%% Defaultwert
set(0,'defaulttextfontname','Helvetica','defaultaxesfontname','Helvetica');
set(0,'defaulttextfontsize',16,'defaultaxesfontsize',14);
set(0,'defaultlinelinewidth',1.5,'defaultlinemarkersize',10);

%% Kapitel 8: Filter %%
clear
close all

%% Aufgabe 1 %%

omega_G = 20;
omega_s = 55;
A_Dq = 1/2;
A_sq = 1/100;

epsilon = sqrt((1/A_Dq)-1);
lambda = sqrt((1/A_sq)-1);

%% Aufgabe 2 %%

N_min = log10(lambda/epsilon)/log10(omega_s/omega_G);
N1 = ceil(N_min);

while 1

    links = 1 / (1 + (omega_s^2/omega_G^2) * (nthroot(1+epsilon^2,N1)-1))^N1;
    rechts = 1/(1 + lambda^2);
    T1 = (sqrt(nthroot(1+epsilon^2,N1)-1))/omega_G;
    if (links<=rechts)
        break
    end
    N1 = N1+1;
end


F1 = tf(1,[T1 1]);
F1 = F1^N1;
figure(1)
bode(F1), grid on, title('Bodediagramm des Filters mit kritischer Dämpfung')

figure(2)
pzmap(F1)

% z = [];
% p = [-1/T 1 N1];
% k = 1/T^N1;

% [z, p, k] = tf2zp(1,[T 1]);

F1=zpk([],repmat(-1/T1,1,N1),1/T1^N1);

figure(3)
bode(F1), grid on, title('Bodediagramm des Filters mit kritischer Dämpfung')

figure(4)
pzmap(F1)

%% Aufgabe 3 %%

N2 = ceil(log(lambda/epsilon)/log(omega_s/omega_G));
a(1) = 1;

while 1

    for n=2:N2
        a(n) = 2*(N2-n+1)/(n*(2*N2-n+1))*a(n-1);
    end

    T2=fsolve(@(T2) filtFun(T2,N2,a,epsilon,omega_G),0.001);
    sum=0;

    for j=1:N2
        sum = sum + a(j)*T2^j*(1i*omega_s)^j;
    end

     if(1./((abs(1+sum)).^2)<=1/(1+lambda^2))
         break;
     end
     N2=N2+1;
end
N2 

for i1=1:N2
   temp(i1) = a(i1)*T2^i1;
end

den = [fliplr(temp) 1];

F2 = tf(1,den);

%% Aufgabe 4 %%
N3 = ceil(log(lambda/epsilon)/log(omega_s/omega_G));

alpha = [];
F3 = tf(1);
for n=1:N3
    alpha(n) = omega_G * epsilon^(-1/N3) * exp(1i*pi*(N3+2*n-1)/(2*N3));
    F3=F3*tf(1,[1 -alpha(n)]);
end

F3=F3*prod(alpha)*(-1)^N3;

%% Aufgabe 5 %%
N4 = ceil(acosh(lambda/epsilon)/acosh(omega_s/omega_G));

F4=tf(1);
alpha4=[];
for n=1:N4
    alpha4(n)=omega_G*sinh(1/N4*asinh(1/epsilon))*...
        cos((2*n+N4-1)/(2*N4)*pi)+1i*omega_G*...
        cosh(1/N4*asinh(1/epsilon))*sin((2*n+N4-1)/(2*N4)*pi);
    F4=F4*tf(1,[1 -alpha4(n)]);
end

if(rem(N4,2)==0) %gerade
    F4=F4/(sqrt(1+epsilon^2))*prod(alpha4);
else %ungerade
    F4=-F4*prod(alpha4);
end

%% Aufgabe 6 %%

omega = logspace(-1,3);
omega = sort([omega omega_s omega_G]);

figure(5)
bode(F1, omega), grid on,
hold on
bode(F2, omega)
hold on
bode(F3, omega)
hold on
bode(F4, omega), legend('Filter kritischer Dämpfung','Bessel' ...
    ,'Butterworth','Tschebychev',Interpreter='latex')
set(findall(gcf,'Type','line'),'LineWidth',2);

%% Aufgabe 7 %%
w = linspace(1,1000,1999);
dw = 0.5;
[A1,ph1] = bode(F1,w);
[A2,ph2] = bode(F2,w);
[A3,ph3] = bode(F3,w);
[A4,ph4] = bode(F4,w);

LZ1 = 1/dw*diff(ph1)/180*pi;
LZ1 = squeeze(LZ1);
LZ2 = 1/dw*diff(ph2)/180*pi;
LZ2 = squeeze(LZ2);
LZ3 = 1/dw*diff(ph3)/180*pi;
LZ3 = squeeze(LZ3);
LZ4 = 1/dw*diff(ph4)/180*pi;
LZ4 = squeeze(LZ4);

figure(6)
semilogx(w(1:end-1),LZ1)
hold on
semilogx(w(1:end-1),LZ2)
hold on
semilogx(w(1:end-1),LZ3)
hold on
semilogx(w(1:end-1),LZ4)
legend('Filter kritischer Dämpfung','Bessel','Butterworth' ...
    ,'Tschebyscheff',Interpreter='latex');
grid on;
xlabel('Kreisfrequenz in [rad/s]',Interpreter='latex');
ylabel('Gruppenlaufzeit in [s]',Interpreter='latex');

%% Aufgabe 8 %%
t_s = 0:0.01:2;
y = sin(2*pi*t_s);
rect = (sign(y)+1)/2;
figure(7)
plot(t_s,rect)
g_x1 = lsim(F1,rect,t_s);
g_x2 = lsim(F2,rect,t_s);
g_x3 = lsim(F3,rect,t_s);
g_x4 = lsim(F4,rect,t_s);
hold on;
plot(t_s,g_x1,'linewidth',2)
plot(t_s,g_x2,'linewidth',2)  
plot(t_s,g_x3,'linewidth',2)
plot(t_s,g_x4,'linewidth',2)
title('Impulsfolge und Systemantworten',Interpreter='latex')
legend('Impulsfolge','Filter kritischer Dämpfung','Bessel','Butterworth' ...
    ,'Tschebyscheff',Interpreter='latex')
xlabel('Zeit in [s]',Interpreter='latex');
ylabel('Amplitude',Interpreter='latex');

%% Aufgabe 9 %%
M = importdata('Messwerte.mat');
t = M.t;
x = M.x;
m1 = lsim(F1,x,t);
m2 = lsim(F2,x,t);
m3 = lsim(F3,x,t);
m4 = lsim(F4,x,t);
x_clean = sin(0.8*omega_G);
figure(8)
plot(t,x)
hold on;
plot(t,m1)
plot(t,m2)
plot(t,m3)
plot(t,m4)
plot(t,x_clean)
title('Filterung eines gestoerten Signals', Interpreter='latex')
legend('gestörtes Signal','Filter kritischer Dämpfung','Bessel','Butterworth','Tschebyscheff', ...
    'ungestörtes Signal')
xlabel('Zeit in [s]', Interpreter='latex')
ylabel('Amplitude', Interpreter='latex')
