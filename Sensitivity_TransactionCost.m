clear;
load reversalCase1.mat
% Initialization of variables
stats=[1,1,1,1];
freq=5;
cost=zeros(1,75);
% Transaction cost from 1%% to 50%%
for i=1:50
    cost_value=i/10000;
    for ii=1:length(data)
        if ~mod((ii-1),5)
          cost(ii,:)=repmat(cost_value,[1,75]);
        else
          cost(ii,:)=repmat(0,[1,75]);  
        end
    end
    PATS_return(:,i)=[1;diag(b_t*(data'-cost'))];
    PA(:,i)=cumprod(PATS_return(:,i));
    [pats_sharpeR,pats_mean,pats_sd]=perform(PATS_return(:,i),.002);
    pats_down=max(Drawdown(PA));
    
    % output the performance under different transaction cost
    stats=[stats;pats_sharpeR,pats_mean,pats_sd,pats_down];
end
stats(1,:)=[];