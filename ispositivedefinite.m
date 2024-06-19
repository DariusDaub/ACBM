function posdef = ispositivedefinite(A)

if issquare(A)==0
    error('Die Matrix ist nicht quadratisch')
else
    herm = (A + A')/2;
    eig_herm = eig(herm);
    posdef = all(eig_herm > 0);
end