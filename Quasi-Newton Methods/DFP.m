%拟牛顿的DFP方法
function [best_x,best_fx,number]=DFP(x0,eps) 
colormap Jet
syms x1 x2 t;  
f=3*x1*x1+5*x2*x2-4*x1*x2-4*x1+8*x2+11;
fx=diff(f,x1);%f对x1求一阶偏导  
fy=diff(f,x2);%f对x2求一阶偏导 
fi=[fx fy];%构造梯度函数 
  
g0=subs(fi,[x1 x2],x0); 
f0=subs(f,[x1 x2],x0); 
H0=eye(2); 
 
xk=x0; 
fk=f0; 
gk=g0; 
Hk=H0; 
k=1;  
while(norm(gk)>eps)%迭代终止条件||gk||<=eps   
    disp(['第' num2str(k) '次寻优']) 
%确定搜索方向   
        pk=-Hk*gk'; 
%由步长找到下一点x(k+1)    
        xk=xk+t*pk';     
        f_t=subs(f,[x1 x2],xk);%由一维搜索找到最优步长    
        df_t=diff(f_t,t);    
        tk=solve(df_t); 
if tk~=0         
    tk=double(tk); 
else
    break; 
end
%计算下一点的函数值和梯度
        xk = subs(xk,t,tk)    
        fk=subs(f,[x1 x2],xk)    
        gk0=gk;     
        gk=subs(fi,[x1 x2],xk) 
%DPF校正公式，找到修正矩阵    
        yk=gk-gk0;    
        sk=tk*pk';
        Hk=Hk-(Hk*yk'*yk*Hk)/(yk*Hk*yk')+sk'*sk/(yk*sk')%修正公式    
        k=k+1; 
end
best_x=xk;%最优点 
best_fx=fk;%最优值 
number=k-1; 
end
