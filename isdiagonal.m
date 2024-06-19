function dg = isdiagonal(A)

if issquare(A)==0
    error('Die Matrix ist nicht quadratisch')
else 
    dg = isdiag(A);
end

