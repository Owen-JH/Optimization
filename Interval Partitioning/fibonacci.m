function f=fibonacci(n)
% 用于产生斐波那契数
n=n+1;
if n>=0
    a=(1+sqrt(5))/2;
    b=(1-sqrt(5))/2;
    c=a.^n-b.^n;
    f=c/sqrt(5);
else
    error('输入有误！请输入正整数(列)');
end
end