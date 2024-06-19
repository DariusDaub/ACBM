function sq = issquare(A)

n = size(A);

if n(1)==n(2)
    sq = 1;
else 
    sq = 0;
end

% sq = n(1)-n(2); %nur wenn 0 raus kommt ist die Matrix quadratisch