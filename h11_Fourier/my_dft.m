function Y = mydft(y)
    %Understanding DFT  https://www.youtube.com/watch?v=QmgJmh2I3Fw
    % used to transfomrm signal from time domain or (spatial[diatance] domain) to frequency domain
    
    y = y(:);       % verify input is column vector
    N = length(y);
    Y = zeros(N,1);    % initialize output vector

    %create fourier transform matrix
    W = exp(-2 * pi * 1i / N);          % W is the N-th root of unity, twiddle factor: exp(-2*pi*i/N)
    WN = W .^ ((0:N-1)' * (0:N-1));

    Y = WN * y;
end
