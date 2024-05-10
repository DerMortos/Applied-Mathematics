function C = orthpoly(N,a,b)
    C = cell(N+1,1);        % initialize cell array to store polynomials
    
    C{1} = 1/sqrt(b-a);     %first entry of cellular array (constant)
    for k = 1:N
        rho = 0;            % initialize the polynomial to be orthogonalized
        for j = 0:k-1
            c =polyip([1 zeros(1,k)],C{j+1},a,b); %first entry, second entry
            
            rho = polyadd(rho,c * C{j+1});
        end

    omega = polyadd([1 zeros(1,k)],-rho);         % create a polynomial of degree k      
    C{k+1} = omega/sqrt(polyip(omega,omega,a,b));   % normalize polynomial to make it orthogonal
    end
end