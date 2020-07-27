%vega是期权价格对波动率的敏感度
syms s x t sigma r
d1=(log(s/x)+(r+sigma^2/2)*t)/(sigma*sqrt(t));
d2=(log(s/x)+(r-sigma^2/2)*t)/(sigma*sqrt(t));
c=s*normcdf(d1)-x*exp(-r*t)*normcdf(d2);
vega=diff(c,sigma); 
f4=matlabFunction(vega);
%@(r,s,sigma,t,x)
df4=@(s) f4(0.04,s,0.2,0.6,100);
figure(4);
title('vega');
fplot(df4,[10,150]);%在区间内绘制函数图像