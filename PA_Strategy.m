clear;
load data_sp500_75.mat
% Passive Aggressive Trading System for Portfolio Optimization
[ b_t,n,m ] = PATS( data, 1.40, 750, 1, 500);
% Mean Variance Strategy
%[ b_mv,~,~ ] = MV(data,10);

%PATS: cumulative return
PATS_return = [1;diag(b_t*(data'))];
PA = cumprod(PATS_return);

%MV: cumulative return
% MV_return = [1;diag(b_mv*(data'))];
% MV = cumprod(MV_return);

% Buy_Hold: cumulative return
BH_return = cumprod([ones(1,m);data]);
BH = sum(BH_return')/m;

% Equal Weights: cumulative return
EW_return = [1;diag(repmat(1/m,[n,m])*(data'))];
EW = cumprod(EW_return);

% Performance
[PATS_sharpeR, PATS_mean, PATS_sd] = perform(PATS_return,.002);
PATS_dd = max(Drawdown(PA));

% [MV_sharpeR, MV_mean, MV_sd] = perform(MV_return,.002);
% MV_dd = max(Drawdown(MV));

% Plot: y axis is in Log form
semilogy(PA(1:50:end)),hold on;
semilogy(BH(1:50:end)'),hold on;
semilogy(EW(1:50:end)),hold on;
% semilogy(MV(1:50:end)'),hold on;
grid on;