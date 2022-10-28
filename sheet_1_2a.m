close all;
clear all;
clc;

%% (a)
% numerical simulation of a Bernoulli process with probability p; each
% process is repeated numtrial times
numtrial = 100000;
prob = 0:0.001:1;
for j = 1:length(prob)
    for i = 1:numtrial
        x(i) = rand<=prob(j);
    end
    meanx(j) = mean(x);
    stdx(j) = std(x);
end
figure;
subplot(1,2,1)
plot(prob,meanx)
title('mean of Bernoulli process')

subplot(1,2,2)
plot(prob,stdx)
title('std of Bernoulli process')
        
% exportgraphics(gcf,'2_figure(a).tif')
