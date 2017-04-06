function [ sharpeR,Artn,ASd] = perform( port_return,r )
    % port_return is daily return, not cumulative return
    % Artn: Annualized return
    % ASdL Annualized Standard Deviation
    days=length(port_return);
    cum=cumprod(port_return);
    Artn=(cum(end))^(252/days)-1;
    ASd=std(port_return)*sqrt(252);
    sharpeR=(Artn-r)/ASd;
end

