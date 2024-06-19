function x_f = bartlett(x)

n_signal = length(x);

if rem(n_signal, 2) == 0	
	
    win = linspace(0, 1, n_signal/2);	
    	
    win(n_signal/2 + 1 : n_signal) = win(n_signal/2 : -1 : 1);	
    	
else	
	
    n1 = n_signal + 1;	
    	
    win = linspace(0, 1, n1/2);	
	
    win(n1/2 : n) = win(n1/2 : -1 : 1);	
	
end	
    	
x_f = x.*win;