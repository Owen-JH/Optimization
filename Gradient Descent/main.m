syms x1 x2 s; %声明符号变量
f=x1^4-2*x1^2*x2-2*x1*x2+2*x1^2+2*x2^2+3*x1-4*x2-1;%设定目标函数
k=grads(f,x1,x2,s,[-5,5],1.000e-8);  %设定定义域和精度
result_string=sprintf('在 %d 次迭代后求出极小值\n',k);
disp(result_string);

