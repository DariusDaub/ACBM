function inv = svd_inv(A)

[U, S, V] = svd(A,"econ");

sw = diag(S);

sw_inv = 1./sw;

sw_inv(abs(sw_inv)>1e9) = 0;

sw_dia = diag(sw_inv);

inv = V*sw_dia*U';

