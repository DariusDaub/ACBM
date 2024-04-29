function q2 = quatcon(q1)

    kon = [1 -1 -1 -1];
    q2 = q1 .* kon;
 
    l = length(q1);
    tf = isreal(q1);

    if l == 4 && tf
    else 
        msg = 'Quaternion nicht reell oder kein Einheitsquaternion';
        error(msg)
    end
end
