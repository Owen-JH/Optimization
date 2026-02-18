function [num_iter,xn,yn]=Fabonacci(f,a,b,eps)
c = (b-a)/eps;
num_iter = 1;
while fibonacci(num_iter) < c  % 确定迭代次数
    num_iter = num_iter+1;
end
x1 = a+fibonacci(num_iter-2)/fibonacci(num_iter)*(b-a);
x2 = a+fibonacci(num_iter-1)/fibonacci(num_iter)*(b-a);
F1 = feval(f,x1);
F2 = feval(f,x2);

for k=1:num_iter-1
    if F1<F2
        b  = x2;
        x2 = x1;
        F2 = F1;
        x1 = a+fibonacci(num_iter-k-2)/fibonacci(num_iter-k)*(b-a);
        F1 = feval(f,x1);
    elseif F1 >= F2
        a  = x1;
        x1 = x2;
        F1 = F2;
        x2 = a+fibonacci(num_iter-k-1)/fibonacci(num_iter-k)*(b-a);
        F2 = feval(f,x2);
    end
end
if F1<F2
    b  = x2;
    x2 = x1;
    F2 = F1;
elseif F1 >= F2
    a = x1;
end
x1 = x2-0.1*(b-a);
 F1 = feval(f,x1);
if F1<F2
    xn = 0.5*(a+x2);
elseif F1 == F2
    xn = 0.5*(x1+x2);
elseif F1>F2
    xn = 0.5*(x1+b);
end
yn=feval(f,xn);
end