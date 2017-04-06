function [drawdown]=Drawdown(profit)
%% Input Cumulative series, output rolling drawdown 
drawdown(1)=0;
for i= 2 : length(profit)
    if profit(i)-profit(i-1)<0 
        loc=find(drawdown==0);
        loc=loc(length(loc));
        loss=(profit(i)-profit(i-1))/profit(loc);
        drawdown(i)=drawdown(i-1)-loss;
    else if drawdown(i-1)==0
            drawdown(i)=0;
        else
            loss=(profit(i)-profit(i-1))/profit(loc);
            drawdown(i)=drawdown(i-1)-loss;
            if drawdown(i)<0
                drawdown(i)=0;
            end
        end
    end
end
end

