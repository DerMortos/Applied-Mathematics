function Y = myfft(y)
    % my_fft computes the Fast Fourier Transform of a 1-D signal.
    % Inputs:  - y: Input signal (a vector containing {y0, y1, ..., yn-1}).
    % Outputs: - Y: Fast Fourier Transform of the input signal.
    
    y = y(:);           % Ensure the input is a column vector            
    N = length(y);      % Length of the input vector    
    
    % Base case for recursion
    if N <= 1
        Y = y;
        return;
    end
    
    % Check if N is even or odd
    if mod(N, 2) == 0
        % Recursive calls (Even-sized input)
        even = myfft(y(1:2:N-1));
        odd = myfft(y(2:2:N));
        
        % calculate twiddle factors
        W_N = exp(-2 * pi * 1i * (0:N/2-1) / N);
        % Combine the results with the twiddle factors
        Y = [even + W_N .* odd; even - W_N .* odd];
    else
        % Fourier matrix multiplication (Odd-sized input)
        omega = exp(-2 * pi * 1i / N);
        j = 0:N-1;
        k = j';
        F = omega .^ (k * j);
        Y = F * y;
    end
end