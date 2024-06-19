function [pl,ql,pr,qr] = pdexbc(xl, ul, xr, ur, t)

pl = [ul(1);-cos(t)];
ql = [0;1];
pr = [ur(1);-cos(t)];
qr = [0;1];
