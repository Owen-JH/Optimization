f=input('请输入目标函数:');
left=input('请输入函数左侧边界:');
right=input('请输入函数右侧边界:');
eps=input('请设定epsilon:');
if left>=right
    disp('error');
else
    disp('初始参数满足条件');
    k=input('请选择函数方法:','s');
end
if (strcmp(k,'bisect'))
    tic
    [num_iter,xn,yn]=bisect(f,left,right,eps);
    disp([num_iter,xn,yn]);
    toc
elseif (strcmp(k,'Fabonacci'))
    tic
    [num_iter,xn,yn]=Fabonacci(f,left,right,eps);
    disp([num_iter,xn,yn]);
    toc
elseif (strcmp(k,'goldencut'))
    tic
    [xn,yn,ea,num_iter]=goldencut(f,left,right,eps);
    disp([xn,yn,ea,num_iter]);
    toc
else
    disp('没有这种函数方法')
end

