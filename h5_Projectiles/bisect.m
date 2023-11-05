function [r, resarray] = bisect(f, a, b, tol, maxiter)
    % This function implements the bisection method for finding a root of the function f
    % in the interval [a, b] with a given tolerance and maximum number of iterations.

    k = 0;                          % Initialize the iteration counter.
    resarray = zeros(1, maxiter);   % Preallocate an array to store the absolute value of f(x) at each step.
    r = NaN;                        % Initialize the result to NaN to indicate that no solution has been found yet.

    % Check if the function at point 'a' is already close enough to zero to be considered a root.
    if abs(f(a)) < tol
        r = a;                      % If yes, 'a' is the root.
        resarray(1) = f(a);         % Save the function value at 'a'.
        resarray = resarray(1:k);   % Remove unused portion of resarray.
        return;                     % Exit the function.
    elseif abs(f(b)) < tol
        r = b;                      % If yes, 'b' is the root.
        resarray(1) = f(b);         % Save the function value at 'b'.
        resarray = resarray(1:k);   % Remove unused portion of resarray.
        return;                     % Exit the function.
    end

    % Start the iteration process.
    while abs(b - a) > tol && k < maxiter % Continue if the interval is larger than the tolerance and the maximum number of iterations is not reached.
        x = (a + b) / 2;            % Calculate the midpoint of the current interval.
        resarray(k+1) = abs(f(x));  % Store the absolute value of the function evaluated at the midpoint.

        % Check if the root is in the left half interval.
        if f(a) * f(x) <= 0
            b = x;                  % If yes, discard the right half by moving 'b' to the midpoint.
        else
            a = x;                  % If not, discard the left half by moving 'a' to the midpoint.
        end

        k = k + 1;                  % Increment the iteration counter.
        r = x;                      % Update the current root approximation with the midpoint value.
    end

    % If the loop ends because the maximum number of iterations was reached,
    % check if the current interval size or function value is within tolerance.
    if k == maxiter && abs(f(x)) > tol
        fprintf('Maximum iterations reached. Root not found to the desired tolerance.\n');
    end

    % Remove unused elements from the resarray.
    resarray = resarray(1:k);
end
