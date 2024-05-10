function Y = ffttx(y)
    % FFTTX Textbook Fast Finite Fourier Transform
    % FFTTX(y) computes the same finite Fourier transform
    % as FFT(y). The code uses a recursive divide and
    % conquer algorithm for even order and matrix-vector
    % multiplication for odd order.
    %
    % Inputs:  - y: Input signal (vector)
    % Outputs: - Y: Fast Fourier Transform of the input signal
    
    % Ensure the input is a column vector
    y = y(:);
    n = length(y);
    omega = exp(-2 * pi * 1i / n);
    
    if rem(n, 2) == 0
        % Recursive divide and conquer
        k = (0:n/2-1)';
        w = omega .^ k;
        u = ffttx(y(1:2:n-1));
        v = w .* ffttx(y(2:2:n));
        y = [u + v; u - v];
    else
        % The Fourier matrix for odd-sized input
        j = 0:n-1;
        k = j';
        F = omega .^ (k * j);
        y = F * y;
    end
end
