function price=AMDownPDE(T,S0,K,sigma,r,N,M)
%显格式有限差分求美式看跌的价格
dt=T/N;
ds=(K+S0)/M;
%确定股票价格步长和时间步长，估计价格越接近理论真实值
tf=@(i) i*dt;
sf=@(j) S0+j*ds;
%根据已知条件计算不变参数
price=zeros(N+1,M+1);
p2=zeros(N+1,M+1);
ex=zeros(1,M+1);
%预宣告，节约计算时间
for j=0:M
    pf=@(x) max(K-x,0);
    %美式看跌期权的边界条件
    price(end,j+1)=pf(sf(j));
    %到期日当天最后阶段的情况生成
end
uf=@
df=@
%
for i=0:N-1
    price(i+1,end)=uf(tf(i),sf(M));
    price(i+1,1)=df(tf(i),sf(0));
end
for i=N-1:-1:0
    for j=1:M-1
        price(i+1,j+1)=price(i+2,j+1)/(r*dt+1)+dt/(r*dt+1)*(r*sf(j)*(price(i+2,j+2)-...
            price(i+2,j))/(2*ds)+0.5*sigma^2*sf(j)^2*((price(i+2,j+2)+price(i+2,j)...
            -2*price(i+2,j+1))/ds^2));
        %利用边界条件解该方程
        ex(j+1)=pf(sf(j+1));
    end
end
for i=N-1:-1:0
    for j=1:M-1
        if price(i+1,j+1)<=ex(j+1)
            price(i+1,j+1)=ex(j+1);
            p2(i+1,j+1)=ex(j+1);
            %从后往前迭代计算不同时间点的价值
        end
    end
end
