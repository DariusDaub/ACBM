function herm = myishermetic(A)

A_konj = A';
if issquare(A)==0
    error('Die Matrix ist nicht quadratisch')
else 
    herm = isequal(A,A_konj);
end


