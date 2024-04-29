function r1 = quatrot(n,alpha, r)

n_normal = n/norm(n);

qd = [cos(alpha/2)  n_normal(1)*sin(alpha/2)  n_normal(2)*sin(alpha/2)  n_normal(3)*sin(alpha/2)];

M1 = [qd(1)^2+qd(2)^2-qd(3)^2-qd(4)^2 2*(qd(2)*qd(3) - qd(1)*qd(4)) 2*(qd(1)*qd(3) + qd(2)*qd(4))];
M2 = [2*(qd(1)*qd(4) + qd(2)*qd(3)) qd(1)^2-qd(2)^2+qd(3)^2-qd(4)^2 2*(qd(3)*qd(4) - qd(1)*qd(2))];
M3 = [2*(qd(2)*qd(4) - qd(1)*qd(3)) 2*(qd(1)*qd(2) + qd(3)*qd(4)) qd(1)^2-qd(2)^2-qd(3)^2+qd(4)^2];

M = cat(1,M1, M2, M3);

r1 = M * r';

end
 