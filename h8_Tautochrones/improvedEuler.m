function [y, t] = improvedEuler(func, v0, t0, tf, Nt)
    % Improved Euler method (Heun's method) implementation
    t = linspace(t0, tf, Nt + 1);
    h = (tf - t0) / Nt;
    y = zeros(length(v0), Nt + 1);
    y(:, 1) = v0;

    for k = 1:Nt
        e = y(:, k) + h * func(t(k), y(:, k));
        y(:, k + 1) = y(:, k) + (h / 2) * (func(t(k), y(:, k)) + func(t(k + 1), e));
    end
end