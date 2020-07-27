function [mu,sigma]=ito(data)
%给定Ito过程的数据，估计其参数
n=numel(data);
z=zeros(n,1);
for i=1:n
    z(i)=log(data(i))/log(data(1));
    %服从Ito过程的股票价格满足：股票价格的变化服从对数正态分布
end
sigma=std(z);
mu=mean(z)+(sigma^2)/2;