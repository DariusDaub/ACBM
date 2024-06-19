function [ld, f] = leistungsdichte(x,dt)

n_signal = length(x);
n_nyquist = fix (n_signal/2);	
f = (0:n_nyquist)/n_signal/dt;
f = f(:);

ld = fft(x) .* conj(fft(x))/n_signal;
ld = ld(1 : n_nyquist +1);
ld = ld(:);