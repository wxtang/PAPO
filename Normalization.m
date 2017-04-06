function [ bn ] = Normalization( bt,n )
%% Some Notations 
% bt: Current weights
% b/bn: updated weights

        % Use CVX to solve the optimization problem
        cvx_begin quiet
            variable bn(n)
            minimize(norm(bn-bt'))
            subject to
                bn>=0;
                sum(bn)==1;
        cvx_end
end
