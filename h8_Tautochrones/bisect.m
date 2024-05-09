function [r, resarray] = bisect(f, a, b, tol, maxiter)
    % Bisection method to find the root of a function
    k = 0;
    resarray = zeros(1, maxiter);
    r = NaN; % Initialize r to NaN to handle the case where no root is found within tolerance

    fa = f(a);
    fb = f(b);

    % Check if the function at point 'a' or 'b' is already close to zero
    if abs(fa) < tol
        r = a;
        resarray(1) = fa;
        return;
    elseif abs(fb) < tol
        r = b;
        resarray(1) = fb;
        return;
    end

    % Check if the function changes sign over the interval [a, b]
    if fa * fb > 0
        error('Function does not change sign over the interval. Bisection method cannot proceed.');
    end

    % Main loop of the bisection algorithm
    while k < maxiter
        k = k + 1;
        r = (a + b) / 2; % Midpoint
        fr = f(r);
        resarray(k) = abs(fr);

        if abs(fr) < tol
            % The root has been found to within the specified tolerance
            resarray = resarray(1:k); % Truncate the residual array
            return;
        end

        if fa * fr < 0
            b = r; % The root is in the left subinterval
            fb = fr;
        else
            a = r; % The root is in the right subinterval
            fa = fr;
        end
    end

    % If the loop exited without finding a root to within the tolerance,
    % warn the user and return the last midpoint as the root approximation
    if abs(fr) > tol
        warning('Maximum iterations reached without finding a root to the desired tolerance.');
    end

    resarray = resarray(1:k); % Truncate the residual array
end