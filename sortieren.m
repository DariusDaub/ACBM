function a = sortieren(a)


for i = 1:length(a)
    P = a(i);
    T = i - 1;

    while (T > 0) & (a(T) > P)
        a(T+1) = a(T);
        T = T - 1;
    end
    a(T+1) = P;
end 
