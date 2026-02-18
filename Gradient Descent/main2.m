n=10;
x=[-5,5];
x_=FR_Wolfe(1.000e-5,x);
fprintf('x*=%f\t%f\n',x_(1),x_(2));
fprintf('f(x)=%f\n',f(x_));