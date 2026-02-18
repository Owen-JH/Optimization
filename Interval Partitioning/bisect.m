function [n,xn,yn]=bisect(f,a,b,eps)
syms x
y=f(x);
f2=matlabFunction(diff(y));
fa_down = feval(f2,a);
fb_up = feval(f2,b);
n = 0;

while(fa_down * fb_up < 0)
    c = 0.5*(b + a);
    fc = feval(f2,c);
    n = n+1;
    if( fc*fa_down < 0 )
        b = c;
    else
        a = c;
    end
    if( abs(b-a) < eps ) 
    break;  
    end
end
xn = 0.5*(b + a);
yn = feval(f,xn);
end
