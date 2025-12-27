function xirr=XIRReturn(Cashflow,Cashflowtime)
%计算时间不均匀的现金流的内部收益率
%Cashflow=[-10000, 2500, 2000, 3000, 4000]；
%Cashflowtime=['01/12/2007'
%                '02/14/2008'
%                '03/03/2008'
%                '06/14/2008'
%                '12/01/2008']
   function f=root2d(r)
       f=pvvar(Cashflow,r,Cashflowtime);
   end
fun=@root2d;
r0=0;
r=fsolve(fun,r0);
xirr=r;
end
