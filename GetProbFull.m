function St = GetProbFull(N,H,K)
    T = GetTransitions(H,K);
    
    St = ProbFullUrn(T,N);
    
    disp(N);
end

function P = ProbFullUrn(T,N)
    U = T;
    
    q = length(T(:,1));
    for i =1:q-1
        U(i,q) = 0;
    end

    U(q,q) = 1;
    %disp(U);
    SO = zeros([q 1]);
    SO(1,:) = 1;
    
    Pr = [];
    for i=1:N
        Pr(i,:) = transpose(mpower(U,i)*SO);
    end
    %disp(Pr);
    P = transpose(Pr(:,q));
end