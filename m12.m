%%% Defaultwerte
set(0,'defaulttextfontname','Helvetica','defaultaxesfontname','Helvetica');
set(0,'defaulttextfontsize',16,'defaultaxesfontsize',14);
set(0,'defaultlinelinewidth',1,'defaultlinemarkersize',10);
%
%% Kapitel 12: Schnelle Fourier-Transformation %%
clear
clc
close all

%% Aufgabe 1 %%

syms x

r = 2 + x;

s = 1 + 2*x + 3*x^2 + 4*x^3 + 5*x^4;

p = expand(r*s);

rr = [2 1];

ss = [1 2 3 4 5];

cc = conv(rr, ss);

dd = deconv(cc, rr);

%% Aufgabe 2 %%

rrr = [rr zeros(1,4)];
sss = [ss zeros(1,1)];

rrrfft = fft(rrr);
sssfft = fft(sss);

ppfft = rrr .* sss;

pp = ifft(ppfft);

%% Aufgabe 3 %%

a = randn(1,100);
b = zeros(1,10); 

x1 = [b a];
x2 = [a b];

figure(1)
plot(x1), grid on
hold on
plot(x2), legend('x1','x2')

kf1 = korrelation(x1,x2);
kf2 = korrelation(x2,x1);

figure(2)
plot(kf1), grid on
hold on
plot(kf2), legend('kf1', 'kf2')

%% Aufgabe 4 %%

t = (0:0.01:10);
x_sin = sin(t);
z = zeros(1,100);
x_sin2 = [z x_sin];
x_sin1 = [x_sin z];
   
figure(3)
plot(x_sin1), grid on
hold on
plot(x_sin2), legend('x_{sin1}', 'x_{sin2}')

kf_sin1 = korrelation(x_sin1,x_sin1);
kf_sin2 = korrelation(x_sin2,x_sin2);

figure(4)
plot(kf_sin1), grid on
hold on
plot(kf_sin2), legend('kf_{sin1}', 'kf_{sin2}')

%% Aufgabe 5 %%
sinus = sin(2*pi*t);
r = normrnd(0,0.1,1,length(sinus));
sinus_r = sinus + r;  

figure(5)
plot(t,sinus_r), grid on
hold on
plot(t,sinus), legend('verrauscht', 'nicht verrauscht')

kf_sinus = korrelation(sinus_r,sinus_r);

figure(6)
plot(t,kf_sinus), grid on

%% Aufgabe 7 %%
t = linspace(0,5,500);
signal = sin(2*pi*10*t);
dt = 0.01;
[ld, f] = leistungsdichte(signal, dt);

figure(7)
plot(f,ld)

%% Aufgabe 8 %%
signal2 = sin(2*pi*10.1*t);

[ld2, f2] = leistungsdichte(signal2, dt);

figure(8)
plot(f2,ld2)

%% Aufgabe 9 %%

signal_win = bartlett(signal2);

figure(9)
plot(signal_win)

[ld3, f3] = leistungsdichte(signal_win,dt);

figure(10)
plot(f2,ld2), grid on
hold on
plot(f3,ld3), legend('ohne Fensterung', 'mit Fensterung')

%% Aufgabe 10 %%
t = 0:0.01:4.99;

s1 = sin(2*pi*5*t);
s2 = sin(2*pi*10*t);
s3 = s1 + s2;

figure(11)
plot(t,s3)

s3_fft = fft(s3);
s3_fft = (abs(s3_fft)).^2;

figure(12)
plot(s3_fft)

s3_fft(51) = 0;
s3_fft(451) = 0;

s3_i = ifft(s3_fft);

figure(13)
plot(t, s2), grid on
hold on
plot(s3_i), legend('5 Hz Signal', 'gefiltertes Signal')


    
