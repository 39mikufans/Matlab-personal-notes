function price=Amcrr(S0,K,r,T,sigma,N)
%二叉树模型计算美式看跌期权的价格
%使用已知变量计算后续不变量的值
deltaT=T/N;
%N越大，期数越多，最后的价格越精确
u=exp(sigma*sqrt(deltaT));
d=1/u;
p=(exp(r*deltaT)-d)/(u-d);
discount=exp(-r*deltaT);
p_u=discount*p;
p_d=discount*(1-p);
%设置期权二叉树的增长、下跌模型
SVals=zeros(2*N+1,1);
SVals(N+1)=S0;
for i=1:N
    SVals(N+1+i)=u*SVals(N+i);
    SVals(N+1-i)=d*SVals(N+2-i);
end
%计算最后一阶段各节点的期权现值
PVals=zeros(2*N+1,1);
for i=1:2:2*N+1
    PVals(i)=max(K-SVals(i),0);
end
%比较每个节点的持有价值和内在价值
for tau=1:N
    for i=(tau+1):2:(2*N+1-tau)
        hold=p_u*PVals(i+1)+p_d*PVals(i-1);
        PVals(i)=max(hold,K-SVals(i));
    end
end
price=PVals(N+1);