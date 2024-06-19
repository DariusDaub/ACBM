function uni = isunitary(A)

if issquare(A)==0
    error('Die Matrix ist nicht quadratisch')
elseif all((all(abs(ctranspose(A)*A - eye(size(A))) < 1e-12)))
    uni = 1;
else
    uni = 0;
end
    

