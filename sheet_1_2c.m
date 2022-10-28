close all;
clear all;
clc;

%% (c)

% create a matrix with size n x n where the elements defined by a Bernoulli
% process of probability p; each process is repeated numtrial times
tic
n = 1000;
numtrial = 100;
prob = 0:0.01:1;
x = cell(1,length(prob));
for i = 1:length(prob)
    for j = 1:numtrial
        A = triu(double(rand(n)<=prob(i)));
        A = A + A';
        x{i} = [(x{i}); (eig(A))'];
    end
end
toc
% save('2c.mat','x','prob')


%%
% plot the eigenvalues distribution for each probability p
% load 2c
figure;
for i = 2:length(prob)-1
    histogram(x{i},'BinLimits',[-40,40],'Normalization','probability')
    title(['prob = ',num2str(prob(i))])
    ylim([0,0.03])
    drawnow;
    pause(0.2)
end