function p=AsianMC(S0,r,T,sigma,pf,N,M,isA)
%%用蒙特卡洛模拟亚式期权，并画出期权价格与仿真参数（路径数量）之间的关系
%pf：支付函数；T：到期时间；r：无风险利率；sigma：波动率  s0：期初价格
%N：时间维度上的分割点数；M：空间维度上的分割点数
%isA=1，算数平均；isA=0，几何平均
dt=T/N;
s=zeros(M,N+1);
s(:,1)=S0;
for i=1:N
    s(:,i+1)=s(:,i).*exp((r-sigma^2/2)*dt+sigma.*sqrt(dt).*randn(M,1));
end
SB=zeros(M,1);%建立空矩阵
if isA
    SB=mean(s,2);%计算算术平均
    % disp(SB)
    size(SB)
else
    SB=exp(mean(log(s),2));%计算几何平均
end
p=exp(-r*T)*mean(pf(SB));%代入公式计算
end