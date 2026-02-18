%保留x位有效数字的函数
function x=baoliu(x,n)
if x==0
    x=x;
elseif x>0
    x1=floor(log10(x));
    if log10(x)==0
        x=x;
    else
        x=round(x/10^x1,n-1)*10^x1;
    end
elseif x<0
        x1=floor(log10(-x));
    if log10(-x)==0
        x=x;
    else
        x=round(x/10^x1,n-1)*10^x1;
    end
end
end