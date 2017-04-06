function [ bn] = PA_update( x, bt, l )
%% Some Notations 
% l: loss calculated from L.F.
% bt: Weights
% x: daily returns (relatives)
% b/bn: updated weights

    sz=size(x);
    eta=l/norm(x-repmat(mean(x),sz))^2;
    bn=bt-eta*(x-repmat(mean(x),sz));
end
