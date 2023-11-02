function [r, resarray] = bisect(f, a, b, tol, maxiter)
    k = 0;
    resarray = zeros(1, maxiter);
    r = NaN; % Initialize r to NaN to handle the case where no root is found within tolerance

    % Check if we already have a root at the boundaries
    if abs(f(a)) < tol
        r = a;
        resarray = f(a);
        return;
    elseif abs(f(b)) < tol
        r = b;
        resarray = f(b);
        return;
    end

    while abs(b - a) > tol
        x = (a + b) / 2;
        resarray(k+1) = abs(f(x));

        if sign(f(a)) == sign(f(x))
            a = x;
        else
            b = x;
        end

        k = k + 1;
        if k == maxiter
            fprintf('Maximum iterations reached. Root not found to the desired tolerance.\n');
            break;
        end

        r = x; % Use the midpoint as the root approximation
    end

    % Resize resarray to include only the non-zero elements
    resarray = resarray(1:k);
end
