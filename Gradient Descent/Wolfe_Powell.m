function a=Wolfe_Powell(x,pk)
%step 1
u=0.1;
b=0.5;
a=1;
n=0;
m=10^100;
%step 2
fx=f(x);
g=n_diff(x);
while 1
    xk=x+a*pk;
    fxk=f(xk);
    gk=n_diff(xk);
    if (fx-fxk)>=(-u*a*g*pk.')%(3-1)
        if (gk*pk.')>=(b*g*pk.')%(3-2)
            return;
        else
            %step 4
            n=a;
            a=min(2*a,(a+m)/2);
        end
    else
        %step 3
        m=a;
        a=(a+n)/2;
    end
end
 