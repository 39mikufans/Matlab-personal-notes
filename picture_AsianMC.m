%绘制亚式期权价格和仿真参数的关系
p1=zeros(1001,1);
%构建空矩阵存放蒙特卡洛模拟出的值
for i=100:1:1100
    p1(i)=AsianMC(S0,r,T,sigma,pf,N,M,isA);
end
plot(p1(100:1100));
xlabel('M');
ylabel('p');
title('亚式期权价格与仿真参数的关系');