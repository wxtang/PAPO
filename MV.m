function [ b_t,n,m ] = MV( data, freq )

% freq is the rebalancing frequency
 [n,m]=size(data);
 b_t=repmat(1/m,[1,m]);
 b_t=repmat(b_t,[120,1]);
 
 for i =21 :freq: n
     fprintf(' Mean-Variance Completed: %f%%\n',100*i/n);
     u=mean(data(i-20:i,:));
     sigma=cov(data(i-20:i,:));
     cvx_begin quiet
        variable w(m)
        minimize(w'*sigma*w)
            subject to
            u*w>=1.005
            w>=0
            sum(w)<=1
     cvx_end
     % If infeasible, assign previous weights to current period
     if isnan(w)
         b_t=[b_t;repmat(b_t(end,:),[freq,1])];
     else
        b_t=[b_t;repmat(w',[freq,1])];
     end
end
end