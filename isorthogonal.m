function orth = isorthogonal(A)

if issquare(A)==0
    error('Die Matrix ist nicht quadratisch')
elseif all((all(abs(A * transpose(A) - eye(size(A))) < 1e-12)))
    orth = 1;
else
    orth = 0;
end
    