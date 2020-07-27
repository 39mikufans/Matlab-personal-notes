function Spaths=AssetPaths(S0,mu,sigma,T,Nsteps,Nrepl)
%给予蒙特卡洛生成的资本价格路径，初始价格为S0，飘移mu，波动率sigma，时间长度T，时间
%阶段数量Nsteps，以及重复计算的次数Nrepl，绘制出价格时间路径
Spaths=zeros(Nrepl,1+Nsteps);
Spaths(:,1)=S0;
dt=T/Nsteps;
%计算步长
nudt=(mu-0.5*sigma^2)*dt;
%根据Ito公式表达的几何布朗运动形式
sidt=sigma*sqrt(dt);
for i=1:Nrepl
    for j=1:Nsteps
        Spaths(i,j+1)=Spaths(i,j)*exp(nudt+sidt*randn);
        %用randn表示服从标准正态分布的随机变量，上式是几何布朗运动随时间变化性质
    end
end
x=1:1:Nsteps;
for k=1:Nrepl
    hold on
    plot(x,Spaths(k,x))
    %将Nrepl次模拟的结果同时绘制在一张图上
end
hold off