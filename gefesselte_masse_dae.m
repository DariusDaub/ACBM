function dae = gefesselte_masse_dae(t,x)

global l m  Fx Fy

dae = [
    x(2);
    1/m * (Fx - x(5)/l * x(1));
    x(4); 
    1/m*(Fy - x(5)/l * x(3));
    x(2)^2 + x(1) * 1/m * (Fx - x(5)/l * x(1)) +...
    x(4)^2+ x(3) * 1/m * (Fy - x(5)/l * x(3))
    ];
