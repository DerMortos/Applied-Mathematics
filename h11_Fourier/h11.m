y = [5,6,7,8,9,10,11,12,13]
a = [1,2,3,4,5,6,7,8];
Y = my_dft(a);
% Display the result
disp('Discrete Fourier Transform:');
disp(Y);

% Compare with MATLAB's built-in function
Y_builtin = fft(y);
disp('Using fft function:');
disp(Y_builtin);


% Timing the runtimes
sizes = 2.^(5:13);                  % from array range
% preallocate for optimization
dft_time = zeros(size(sizes));
my_fft_time = zeros(size(sizes));
sys_fft = zeros(size(sizes));

% signal generation // testing and benchmarking
for i = 1:length(sizes)
    n = sizes(i);
    signal = rand(1,n);             

    startTime1 = tic;
    Y1 = my_dft(y);
    dft_time(i) = toc(startTime1);

    startTime2 = tic;
    Y2 = my_fft(y);
    my_fft_time(i) = toc(startTime2);

    startTime3 = tic;
    Y3 = fft(y);
    sys_fft(i) = toc(startTime3);
end

 % Plotting runtimes using log-log scale
figure;
loglog(sizes, dft_time, '-o', 'DisplayName', 'my_dft');
hold on;
loglog(sizes, my_fft_time, '-x', 'DisplayName', 'my_fft');
loglog(sizes, sys_fft, '-s', 'DisplayName', 'MATLAB fft');
xlabel('Input Size (n)');
ylabel('Time (seconds)');
title('Comparison of FFT Implementations');
legend('show');
grid on;