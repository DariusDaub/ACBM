function y = filtFun(T2,N2,a,epsilon,omega_G);

sum=0;
for j=1:N2
    sum = sum + a(j)*T2^j*(1i*omega_G)^j;
end

  y=1./((abs(1+sum)).^2)-1/(1+epsilon^2);
  
end
