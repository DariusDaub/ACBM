function r1 = rotquat(n, alpha, r)

qd = [cos(alpha/2)  n(1)*sin(alpha/2)  n(2)*sin(alpha/2)  n(3)*sin(alpha/2)];

qd_konj = quatcon(qd);


r1 = quadprod(qd,r);
r1 = quadprod(r1,qd_konj);


end
