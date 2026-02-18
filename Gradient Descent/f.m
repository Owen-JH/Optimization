function y=f(x)
if(length(x)==1)
    global xk;
    global pk;
    x=xk+x*pk;
end
y=x(1)^4-2*x(1)^2*x(2)-2*x(1)*x(2)+2*x(1)^2+2*x(2)^2+3*x(1)-4*x(2)-1;