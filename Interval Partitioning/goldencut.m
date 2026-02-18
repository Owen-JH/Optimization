function [x,fx,ea,num_iter] = goldencut(f,xl,xr,es,maxit)
%goldmin:用黄金分割法求解函数极小值
%%输入:
%f=将要解的函数方程
%xl=（x_left），xl=（x_right）搜索区间
%es=允许的容差
%maxit = 允许的最大迭代次数
%%输出：
%x=所求极小值点
%fx=所求极小值
%ea=相对误差（ea<=es时即可输出）
%iter=迭代次数
if nargin<3
    error('最少需要输入三个参数——函数和搜索区间')
end
%当输入的参数少于3个时，即函数和搜索区间没有齐全时，报错！
if nargin<4 || isempty(es)
    es=0.0001;
end
%当输入的参数少于4个时（没有输入容差），默认为0.0001
if nargin<5 || isempty(maxit)
    maxit=50;
end
%当输入的参数少于5个时（没有输入最大迭代次数），默认为50次
phi=(1+sqrt(5))/2;    
num_iter=0;
d=(phi-1)*(xr-xl);
x1=xl+d;
x2=xr-d; 
%xl和xr之间的两个黄金分割点
f1=f(x1);
f2=f(x2);
while(1)
    xint=xr-xl;
    if f1 < f2
        xopt=x1;  %x1是当前迭代的极小值点，用xopt表示  
        xl=x2;    %舍弃掉xl~x2这一段区间，令x2为新的xl，缩小区间
        x2=x1;    %由黄金分割的性质，x1恰在新区间的左黄金分割点（令其为x2）上
        f2=f1;    
        x1=xl + (phi - 1)*(xr-xl); 
        f1=f(x1);   %更新迭代值
    else
        xopt=x2; 
        xr=x1; 
        x1=x2; 
        f1=f2;
        x2=xr - (phi - 1)*(xr-xl); 
        f2=f(x2);
    end
    num_iter = num_iter+1;
    if xopt~=0
        ea=(2-phi)*abs(xint/xopt) ;
    end
    if ea <= es || num_iter>=maxit
        break
    end
end
x=xopt;
fx=f(xopt);
end