function [r, resarray] = newton(f, df, x0, tol, maxiter)
%NEWTON Performs Newton-Raphson method to find the root of a function
%   [r, resarray] = newton(f, df, x0, tol, maxiter) returns the root 'r'
%   of the function 'f' given its derivative 'df', an initial guess 'x0',
%   a tolerance 'tol', and a maximum number of iterations 'maxiter'.
%   'resarray' returns the absolute value of 'f(x)' at each iteration.

k = 0;                          % Initialize iteration counter
x = x0;                         % Initialize current guess for root
resarray = zeros(1, maxiter);   % Preallocate array for residuals for efficiency

% Loop until the absolute value of f(x) divided by df(x) is greater than tolerance
while abs(f(x)/df(x)) > tol
    x = x - f(x)/df(x);     % Update x using Newton-Raphson formula
    k = k+1;                % Increment iteration counter
    
    % Saving residual |f(x)| in the kth space of resarray
    resarray(k) = abs(f(x));    % Store the absolute residual
    
    % If maximum number of iterations is reached, exit the loop
    if k == maxiter
        fprintf('Root not found to tolerance\n')
        break;
    end
    
    % Store the absolute value of the current guess for root
    r = abs(x);
end

% Logical indexing to trim the resarray to the actual number of iterations
L = logical(resarray);
resarray = resarray(L);
end
