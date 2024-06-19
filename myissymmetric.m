function sym = myissymmetric(A)

if issquare(A)==0
    error('Die Matrix ist nicht quadratisch')
else 
    for n=1:size(A,1)-1
    sym(n) = isequal(diag(A,n),diag(A,-n));
end
end
 sym = any(sym,'all');