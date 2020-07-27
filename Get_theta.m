%theta是标的资产价格对时间的敏感度
syms s x t sigma r
d1=(log(s/x)+(r+sigma^2/2)*t)/(sigma*sqrt(t));
d2=(log(s/x)+(r-sigma^2/2)*t)/(sigma*sqrt(t));
c=s*normcdf(d1)-x*exp(-r*t)*normcdf(d2);
theta=diff(c,t); 
f3=matlabFunction(theta);
%@(r,s,sigma,t,x)
df3=@(s) f3(0.04,s,0.2,0.6,100);
figure(3);
title('theta');
fplot(df3,[10,150]);%在区间内绘制函数图像