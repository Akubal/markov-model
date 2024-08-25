function f = GetExpTimeToFill(H,K,EPS)
    T = GetTransitions(H,K);
    
    
    f = ExpTimeToFill(T,EPS,H,K);
   
    disp(EPS);
end

function e = ExpTimeToFill(T,EPS,H,K)
    i = 1;
    P = GetProbFull(1,H,K);
    while (1-P(length(P)))*i > EPS
       i=i+1;
       P = GetProbFull(i,H,K);
       
    end

    disp(i);
    rs = P(1);
    for j=2:i
        rs = rs + j*(P(j)-P(j-1));
    end
    e=rs;
end