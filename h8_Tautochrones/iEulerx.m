function [y, t] = iEuler(func, v0, t0, tf, Nt)

    t = linspace(t0, tf, Nt+1);     % Create a vector of time values
    h = (tf - t0) / Nt;             % Step size

    y = zeros(length(v0), Nt + 1);  % Initialize the solution matrix
    y(:, 1) = v0;                   % Set the initial condition

    for k = 1:Nt
        fk = func(t(k), y(:, k));            % Evaluate function at current time and state
        e = y(:, k) + h * fk;                % Estimate next value (Euler step)
        fke = func(t(k+1), e);               % Evaluate function at estimated next value
        y(:, k+1) = y(:, k) + (h/2) * (fk + fke); % Corrected step: average of slopes
    end

end
