function St = GetStationary(H, K)
    T = GetTransitions(H,K);
    
    St = Stationary(T);
    
end

function S = Stationary(T)
    Id = [];
    I = eye(length(T(1,:)));
    Q = T-I;
    
    for i=1:length(T(1,:))
        Id(end+1) = 1;
    end
    Q(end+1,:) = Id;
    r = zeros([length(Q(:,1)) 1]);
    r(length(r)) = 1;
    Q = Q\r;
    disp(T*Q);
    
    S = Q;
    
end