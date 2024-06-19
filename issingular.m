function sing = issingular(A)

if issquare(A)==0
    error('Die Matrix ist nicht quadratisch')
else 
    sing = iszero(det(A));
end
    