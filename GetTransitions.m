function F = GetTransitions(H, K)
    S = States(K);
    F = Transition(H, S, K);
    disp(K);
    disp(H);
end

function T = Transition(H,S,K)
    TotalCoins = sum(K);
    states = length(S(1,:));
    transitions = zeros(states);
    for j=1:states
        for i=1:states
            diff = sum(abs(S(:,j)-S(:,i)));
            if diff<=1
                prob = 0;
                coinsInUrnInStateI = sum(S(:,j));
                coinsInUrnInStateF = sum(S(:,i));
                coinsOutInStateI = TotalCoins - coinsInUrnInStateI;
                coinsOutInStateF = TotalCoins - coinsInUrnInStateF;
                if j == i
                    if coinsInUrnInStateI == 0 || coinsOutInStateI == 0
                        for k = 1:length(H)
                            if coinsInUrnInStateI == 0
                                prob = prob + (1-H(k))*((K(k)-S(k,j))/coinsOutInStateI);
                            else
                                prob = prob + H(k)*(S(k,j)/coinsInUrnInStateI);
                            end
                              
                        end
                    else
                       
                        for k = 1:length(H)
                            prob = prob + (1/2)*H(k)*(S(k,j)/coinsInUrnInStateI) + (1/2)*(1-H(k))*((K(k)-S(k,j))/coinsOutInStateI);
                        end
                    end
                end
                
                for coin =1:length(H)
                    if S(coin,j) > S(coin,i)
                        
                        if coinsInUrnInStateI == 0 || coinsOutInStateI == 0
                            
                            %disp((1-H(coin))*(S(coin,j)/coinsInUrnInStateI));
                            prob = (1-H(coin))*(S(coin,j)/coinsInUrnInStateI);
                        else
                            prob = (1/2)*(1-H(coin))*(S(coin,j)/coinsInUrnInStateI);
                        end 
                    elseif S(coin,j) < S(coin,i)
                        if coinsInUrnInStateI == 0 || coinsOutInStateI == 0
                            prob = H(coin)*((K(coin)-S(coin,j))/coinsOutInStateI);
                        else
                            prob = (1/2)*H(coin)*((K(coin)-S(coin,j))/coinsOutInStateI);
                        end
                    
                    end
                end
               transitions(i,j) = prob; 
            end
        end
    end
    T = transitions;
end