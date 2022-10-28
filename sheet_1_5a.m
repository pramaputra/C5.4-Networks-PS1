close all;
clear all;
clc;

% create a small matrix of size 8
% adjacency matrix
A = [0 0 1 0 0 0 0 0;
    0 0 1 0 0 0 0 0;
    1 1 0 1 0 0 0 0;
    0 0 1 0 1 0 0 0;
    0 0 0 1 0 1 0 0;
    0 0 0 0 1 0 1 1;
    0 0 0 0 0 1 0 0;
    0 0 0 0 0 1 0 0];

% graph code representation; s is 'source' and t is 'target'
s = [1 2 3 4 5 6 6];
t = [3 3 4 5 6 7 8];
G = graph(s,t);
figure;
plot(G)

%% centrality
% compute different measures of centrality
betweenness = centrality(G,'betweenness')/((6*7)/2);
closeness = centrality(G,'closeness');
degree = centrality(G,'degree')/8;
pagerank = centrality(G,'pagerank');

cent = [betweenness closeness degree pagerank];
[(1:8)' betweenness closeness degree pagerank]

pcorr = corrcoef([betweenness closeness degree pagerank]);

for i = 1:4
    for j = 1:4
        kcorr(i,j) = corr(cent(:,i),cent(:,j),'type','Kendall');
    end
end

pcorr
kcorr