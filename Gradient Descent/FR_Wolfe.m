function xk=FR_Wolfe(e,x)
global xk;
global pk;
g0=n_diff(x);
pk=-g0;
xk=x;
while 1
    a=Wolfe_Powell(xk,pk);
    xk=xk+a*pk;
    g1=n_diff(xk);
    %范数使用平方和开根号
    if sqrt(sum(g1.^2))<=e
        return;
    end
    b=(g1*g1')/(g0*g0');
    pk=-g1+b*pk;
    g0=g1;
end