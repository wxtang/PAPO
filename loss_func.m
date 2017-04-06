function [ loss ] = loss_func(x,bt,e,flag)
%% Some Notations 
% e: threshold
% flag: 0-reversal; 1-momentum
% bt: Weights
% x: daily returns (relatives)

    switch flag
        case 0
            % reversal
            loss=max(0,(x*bt'-e));
        case 1
            % momentum    
            loss=min(0,(x*bt'-e));    
    end
end

