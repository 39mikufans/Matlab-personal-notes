function price=LookbackMC(s0,r,T,sigma,pf,N,M)
%用蒙特卡洛模拟回望看涨期权
%pf：支付函数；T：到期时间；r：无风险利率；sigma：波动率
%N：时间维度上的分割点数；M：空间维度上的分割点数
dt=T/N;
s=zeros(M,N+1);%建立空矩阵
 %将每次模拟的值存在矩阵中
s(:,1)=s0;%初始价格
    for i=1:N
        s(:,i+1)=s(:,i).*exp((r-sigma^2/2)*dt+sigma.*sqrt(dt).*randn(M,1));
    end
  price=exp(-r*T)*mean(pf(max(s,[],2)));%先算每一路径的最大值，再代入求价格的公式
 end
