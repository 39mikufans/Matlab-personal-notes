function garchfun()
%14917118 何祎航
[data,txt]=xlsread('601857.csv');
m=txt(2:49,1);
t=datetime(m);
nr=xlsread('601857.csv','D2:D49');
table1=timetable(t,nr);
Mdl = garch('GARCHLags',1,'ARCHLags',1,'Offset',NaN);
EstMdl = estimate(Mdl,nr);
numObs=numel(nr);
numpaths=100;
rng(1);
[VSim,YSim] = simulate(EstMdl,numObs,'NumPaths',numpaths);
VSimBar = mean(VSim,2);
VSimCI = quantile(VSim,[0.025 0.975],2);
YSimBar = mean(YSim,2);
YSimCI = quantile(YSim,[0.025 0.975],2);
figure;
subplot(2,1,1);
h1 = plot(t,VSim,'Color',0.8*ones(1,3));
hold on;
h2 = plot(t,VSimBar,'k--','LineWidth',2);
h3 = plot(t,VSimCI,'r--','LineWidth',2);
hold off;
title('Simulated Conditional Variances');
ylabel('Cond. var.');
xlabel('Year');
subplot(2,1,2);
h1 = plot(t,YSim,'Color',0.8*ones(1,3));
hold on;
h2 = plot(t,YSimBar,'k--','LineWidth',2);
h3 = plot(t,YSimCI,'r--','LineWidth',2);
hold off;
title('Simulated Nominal Returns');
ylabel('Nominal return (%)');
xlabel('Year');
legend([h1(1) h2 h3(1)],{'Simulated path' 'Mean' 'Confidence bounds'},...
    'FontSize',7,'Location','NorthWest');
end