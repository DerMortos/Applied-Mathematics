function [r, resarray] = bisect(f, a, b, tol, maxiter)
    k = 0;
    resarray = zeros(1, maxiter);
    r = NaN; % Initialize r to NaN to handle the case where no root is found within tolerance

    % Check if we already have a root at the boundaries
    if abs(f(a)) < tol
        r = a;
        resarray(1) = f(a);
        resarray = resarray(1:k); % Truncate the array
        return;
    elseif abs(f(b)) < tol
        r = b;
        resarray(1) = f(b);
        resarray = resarray(1:k); % Truncate the array
        return;
    end

    while abs(b - a) > tol && k < maxiter
        x = (a + b) / 2;
        resarray(k+1) = abs(f(x));

        if f(a) * f(x) <= 0
            b = x;
        else
            a = x;
        end

        k = k + 1;
        r = x; % Use the midpoint as the root approximation
    end

    if k == maxiter && abs(f(x)) > tol
        fprintf('Maximum iterations reached. Root not found to the desired tolerance.\n');
    end

    % Resize resarray to include only the elements up to the k-th
    resarray = resarray(1:k);
end

