function dx = aulainvariancia(t,x)
    dx(1,1) = x(2);
    dx(2,1) = -x(1) + (x(1)^3)/3 - x(2);
return