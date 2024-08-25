function S = States(K)
    disp(K);
    numStates = 1;
    States = [];
    for i=1:length(K)
        numStates = numStates*(1 + K(i));
    end
    singleState = numStates;
    for i =1:length(K)
        st = [];
        singleState = singleState/(1+K(i));
        for l =1:(numStates/(singleState*(1+K(i))))
        for j = 0:K(i)
            for k = 1:singleState
                st(end+1) = j;
            end
            
        end
        end
        States(end+1,:) = st;
    end
    S = States;
end