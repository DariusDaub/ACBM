function   [c,f,s] = pdexpde(x,t,u, DuDx)

c = [1;1];
f = [0; DuDx(1)];
s = [u(2);0];