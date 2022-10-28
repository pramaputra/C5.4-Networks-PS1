close all;
clear all;
clc;

data = load('10cityGCs.txt');
city = {'Edinburgh','Glasgow','Cardiff','Bristol','Nottingham','Birmingham',...
    'Sheffield','Leeds','Manchester','London'};

% plot networks in a circle alignment and plot the degree distribution
for i = 1:10
    [row,col] = find(data(:,1)==i);
    mat{i} = full(sparse(data(row,2),data(row,3),ones(length(row),1)));
    [X,Y] = adjacency_plot_und(mat{i});
    deg{i} = sum(mat{i});
    %% plot figure
    figure(i)
    subplot(1,2,1)
    plot(X,Y)
        
    subplot(1,2,2)
    histogram(deg{i})
    
    sgtitle([city{i},' (mean = ',num2str(mean(deg{i})),')'])
    exportgraphics(gcf,['1_figure(',num2str(i),').tif'])
    %%
    clear row col X Y
end


