%迭代寻找每步的Xb+
function Xq=iteration(Xb,B,Aq)
Xq=0;
while isempty(find(Xb<=0, 1))
    Xq=Xq+0.0001;
    Xb=Xb-0.0001*B*Aq;
end
end
    