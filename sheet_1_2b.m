close all;
clear all;
clc;

%% (b)
% compute the 1D random walk where a walker can move to the right with
% probability 1/2 and move to the left with probability 1/2; the stepsize
% is 1
tic
stepsize = 1;

time = 501;
walkers = 5000;
loc = zeros(walkers,1); %t = 1 means t = 0 in the formula

for t = 2:time
    p = rand(walkers,1);
    loc(:,t) = loc(:,t-1) + (p>=0.5)*stepsize - (p<0.5)*stepsize;
end
toc
dev = std(loc); %standard deviation

%%
% plot figures
figure;
subplot(1,2,1)
hold on
plot(repmat(1:time,walkers,1),loc,'.k')
plot(1:time,dev,'--r')
plot(1:time,-dev,'--r')
axis tight
box on

subplot(1,2,2)
hold on
plot(1:time-1,kurtosis(loc(:,2:end)))
plot(1:time-1,3*ones(1,time-1),'--r')
axis tight
box on

% exportgraphics(gcf,['2_figure(b).tif'])

xpos = -25:0.2:25;
figure;
subplot(1,3,1)
hold on
histogram(loc(:,51),'Normalization','pdf')
plot(xpos,1/sqrt(2*pi*50)*exp(-(xpos).^2/(2*50)),'--r')
title('t = 50')
box on

subplot(1,3,2)
hold on
histogram(loc(:,101),'Normalization','pdf')
title('t = 100')
box on

subplot(1,3,3)
hold on
histogram(loc(:,501),'Normalization','pdf')
title('t = 500')
box on

% for i = 1:ngrid
%     y(i) = sum(double(loc==(L0+(i-1)*stepsize)),'all');
% end
% figure;
% plot(L0:stepsize:L1,y/(time*walkers))
