A=[1 1 1 0;2 0.5 0 1];
b=[0;0;5;8];
C=[-4;-2;0;0];
start=[0;0;5;8];
num=1;%记录迭代次数
B=find(start);%计算基矩阵
N=find(start==0);%计算非基矩阵
Xb=start(B,1);
S=C(N,1)-(A(:,N))'*pinv((A(:,B))')*C(B,1);%第一次计算Sn
%当Sn向量中有小于0的数时循环迭代
[m,q]=min(S);
Xq=baoliu(iteration(b(B,1),pinv(A(:,B)),A(:,N(q))),5);%由于寻找Xb+的过程(iteration函数)中Xq+小数点后很多位无法消除，故用'baoliu'函数保留五位有效数字
Xb=Xb-Xq*pinv(A(:,B))*A(:,N(q));
Xb=baoliu(Xb,5);
[p,n]=find(Xb==0);
Xb(p)=Xq;%更新Xb+
%对调B和N中基向量的位置
trans=N(q);
N(q)=B(p);
B(p)=trans;
S=C(N,1)-(A(:,N))'*pinv((A(:,B))')*C(B,1);
num=num+1;

[m,q]=min(S);
Xq=baoliu(iteration(Xb,pinv(A(:,B)),A(:,N(q))),5);
Xb=Xb-Xq*pinv(A(:,B))*A(:,N(q));
Xb=baoliu(Xb,4);




