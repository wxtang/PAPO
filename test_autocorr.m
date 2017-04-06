clear;
load data_sp500_75.mat
[n,m]=size(data);
corr=[];
% test auto correlation
for i =1 :m
    corr(:,i)=autocorr(data(:,i));
end
mean_corr=mean(corr');
plot(mean_corr)