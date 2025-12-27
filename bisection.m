function x0=bisection(f,int1,int2,err)
%二分法求函数的根,其中f是函数表达式，int1和int2是区间端点，err是精度要求
fl=f(int1);fr=f(int2);
if fl==0     %判断两端点是否为零点
    x0=int1;
    return;
elseif fr==0
    x0=int2;
    return;
end
if fl*fr>0               %判断两端点是否同号
    error('两端点同号');
end
while (int2-int1>err)     %主循环
    mid=0.5*(int1+int2);
    fm=f(mid);
    if fm*fl>0
        int1=mid;
    elseif fm*fr>0
        int2=mid;
    else         %fm恰好为零点的情况
        break;
    end
end
x0=mid;
end
