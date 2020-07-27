%gamma是Delta对标的资产价格的敏感度
syms s x t sigma r
d1=(log(s/x)+(r+sigma^2/2)*t)/(sigma*sqrt(t));
d2=(log(s/x)+(r-sigma^2/2)*t)/(sigma*sqrt(t));
c=s*normcdf(d1)-x*exp(-r*t)*normcdf(d2);
gamma=diff(c,s,2); 
f2=matlabFunction(gamma);
%@(r,s,sigma,t,x)
df2=@(s) f2(0.04,s,0.2,0.6,100);
figure(2);
title('gamma');
fplot(df2,[10,150]);%在区间内绘制函数图像