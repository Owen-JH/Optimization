%单纯形法求解线性规划问题
function [Xm,Fm,num]=simplex(A,b,C,start)%A为约束矩阵左侧系数,b为约束矩阵右侧结果,C为所求函数,start为初始可行点
num=1;%记录迭代次数
B=find(start);%计算基矩阵
N=find(start==0);%计算非基矩阵
Xb=start(B,1);
S=C(N,1)-(A(:,N))'*pinv((A(:,B))')*C(B,1);%第一次计算Sn
while ~isempty(find(S<0,1))%当Sn向量中有小于0的数时循环迭代
[m,q]=min(S);
Xq=baoliu(iteration(Xb,pinv(A(:,B)),A(:,N(q))),5);%由于寻找Xb+的过程(iteration函数)中Xq+小数点后很多位无法消除，故用'baoliu'函数保留五位有效数字
Xb=Xb-Xq*pinv(A(:,B))*A(:,N(q));
[p,n]=find(Xb<=0);
Xb(p)=Xq;%更新Xb+
%对调B和N中基向量的位置
S=C(N,1)-(A(:,N))'*pinv((A(:,B))')*C(B,1);
num=num+1;
end
start(B,1)=Xb;
start(N,1)=0;
Xm=start;
Fm=pinv(C)*start;
end