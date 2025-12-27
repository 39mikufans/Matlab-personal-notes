function price=KnockMC(s0,r,T,sigma,pf,N,M,H)
%用蒙特卡洛模拟向上敲出期权
%pf：支付函数；T：到期时间；r：无风险利率；sigma：波动率
%N：时间维度上的分割点数；M：空间维度上的分割点数
dt=T/N;
s=zeros(M,N+1);
s(:,1)=s0;%初始价格
if s0>H   %初始价格大于障碍H
    error('初始值大于障碍，请重新输入');
    return;
end
for i=1:N
    s(:,i+1)=s(:,i).*exp((r-sigma^2/2)*dt+sigma.*sqrt(dt).*randn(M,1));%根据波动计算
    for j=1:M
        if s(j,i+1)>H
            s(j,i+1)=0;%价格大于障碍H，合同提前终止
        end
    end
end
price=exp(-r*T)*mean(pf(mean(s,2)));       %先求行均值，再计算
end
