function p = quadprod(q1,q2)

l1 = length(q1);
l2 = length(q2);
tf1 = isreal(q1);
tf2 = isreal(q2);
 
    if l1 == 4 && l2 == 4 && tf1 && tf2
    else 
        msg = 'Quaternionen nicht reell oder keine Einheitsquaternionen';
        error(msg)
    end

a = (q1(1)*q2(1) - q1(2)*q2(2) - q1(3)*q2(3) - q1(4)*q2(4));
b = (q1(1)*q2(2) + q1(2)*q2(1) + q1(3)*q2(4) - q1(4)*q2(3));
c = (q1(1)*q2(3) - q1(2)*q2(4) + q1(3)*q2(1) + q1(4)*q2(2));
d = (q1(1)*q2(4) + q1(2)*q2(3) - q1(3)*q2(2) + q1(4)*q2(1));

p = [a b c d];


end