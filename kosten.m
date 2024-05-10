function fehler = kosten(par, verlauf)

d_m = par(1);
w0_m = par(2);
k_m = par(3);

num_m = k_m * w0_m^2;
den_m = [1, 2*d_m*w0_m, w0_m^2];

sys_tf_m = tf(num_m, den_m);

t1 = 0:0.1:10;
verlauf_m = step(sys_tf_m,t1);

fehler = norm(verlauf - verlauf_m);

plot([verlauf, verlauf_m])	
% plot(verlauf_m)
	
drawnow	
