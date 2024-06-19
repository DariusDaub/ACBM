function ode = gefesselte_masse_ode(t,x)

global l m Fx Fy	
    
s = (m*(x(2)*x(2) + x(4)*x(4)) + Fx*x(1) + Fy*x(3))/l; 

ode = [
    x(2);
    1/m*(Fx - s/l*x(1));
    x(4);
    1/m*(Fy - s/l*x(3))
    ];
