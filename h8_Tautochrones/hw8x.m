% Define constants
R = 2;            % The radius in your problem
Ntps = 100;       % Number of time steps per second
tol = 1e-10;      % Tolerance for bisection method
maxiter = 40;     % Maximum iterations for bisection method

% Define the range for phi_0
phi_0_range = (pi/20):(pi/20):(19*pi/20);

% Preallocate the array for the time solutions
tb = zeros(size(phi_0_range));

% Loop over the range of phi_0 values
for k = 1:length(phi_0_range)
    phi_0 = phi_0_range(k);

    % Define the objective function for the current phi_0
    f = @(t) obj_func(t, R, phi_0, Ntps);

    % Initial interval for bisection method
    a = 1; 
    b = 2;

    % Call the bisection method
    [tb(k), ~] = bisect(f, a, b, tol, maxiter);
end

% Plot the results
figure(1);
plot(phi_0_range, tb, 'b.-', 'LineWidth', 3);
hold on;
ylim([0 3]);
xlabel('\phi_0 (radians)');
ylabel('Time (seconds)');
title('Time to reach bottom of cycloidal halfpipe');
grid on;
hold off;
