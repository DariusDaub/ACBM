function kf = korrelation(r,s)

r_fft = fft(r);
s_fft = fft(s);

r_fft = conj(r_fft);

p = r_fft .* s_fft;
 
kf = ifft(p);