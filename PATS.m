function [ b_t,n,m ] = PATS( data, e, lag, flag, freq )
%% Some Notations 
% data: input data
% e: threshold
% lag: returns that are used to update weights
% flag: 0-reversal; 1-momentum
% freq: rebalance frequency
% b_t: Weights Matrix throughout the period
% x: daily returns (relatives)
% b/bn: updated weights
    
    %Initialization
    [n,m]=size(data);
    b_t=repmat(1/m,[1,m]);
    b_t=repmat(b_t,[lag+1,1]);
    
    for it =lag+1:freq:n-1
        fprintf(' PATS Completed: %f%%\n',100*it/n);
        
        % Extract price relatives and current weights 
        x=(data(it-lag,:));
        bt=b_t(end,:);
        
        % Calculate Loss Function
        loss=loss_func(x,bt,e,flag);
        if loss~=0
            % Update the weights
            [b] = PA_update( x, bt, loss ); 
            % Normalize the weights by adding short selling constraints
            [bn] = Normalization( b,m );
            b_t=[b_t;repmat(bn',[freq,1])];          
        else
            b_t=[b_t;repmat(bt,[freq,1])];
        end    
    end
end

