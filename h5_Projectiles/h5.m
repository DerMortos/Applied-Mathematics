m = 10;         % mass in kg
gamma = 0.1;    % coefficient of friction
y0 = 1;         % initial height in meters
g = 9.8;        % acceleration due to gravity in m/s^2
v0 = 100;       % initial velocity in m/s
theta = pi/4;   % angle of launch in radians (45 degrees)
t0 = 0;         % initial timing

% Define the function for the height of the projectile over time.
y = @(t) ((m*v0*sin(theta))/gamma + (g*m^2)/gamma^2)*(1-exp((-gamma/m)*(t-t0))) - ((g*m)/gamma)*(t-t0) + y0;

dy = @(t)    (v0 * sin(theta) + (g * m) / gamma) * exp(-gamma/m * (t - t0)) - (g * m) / gamma;

figure(1)
% Find the time when the projectile hits the ground (i.e., y(t) = 0)

% Bisection Method
% Apply the bisection method to find when the projectile hits the ground
[r, resarray] = bisect(y, 0, 10, 1e-6, 100); % Initial interval guess [0, 10] seconds
iterBisect=length(resarray);
timeBisect = r
     
t = linspace(1,15,1000);
semilogy(1:iterBisect,resarray, 'b-', 'linewidth',3)
hold on;
xlabel('Number of iterations')
ylabel('residuals (log scale)')
title('Convergence of Bisection and Newton Methods')

% Newton's Method
% Apply Newton's method to find when the projectile hits the ground
[r,resarray] = newton(y,dy,10,1e-6,25);
iterNewton =length(resarray);
timeNewton = r

t = linspace(1,15,1000);
semilogy(1:iterNewton,resarray, 'g-', 'linewidth',3)
legend('Bisection Method', 'Newton Method')
xlabel('Number of iterations')
ylabel('Absolute residual (log scale)')

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%

tolerance = 1e-6;
maxIterations = 100;
a = 0;      % Initial interval guess
b = 10;     % Initial interval guess

% Calling the bisect function
[r, resarray] = bisect(y, a, b, tolerance, maxIterations);

% Hang time
hang_time = r;

% Plot the hang time
t_vals = linspace(0, hang_time, 1000);
y_vals = arrayfun(y, t_vals);

figure; % Create a new figure
plot(t_vals, y_vals, 'b-'); % Plot time vs height
grid on;
xlabel('Time (seconds)');
ylabel('Height (meters)');
title('Projectile Hang Time');
hold on;

% Mark the hang time on the plot
plot(hang_time, 0, 'ro');
legend('Trajectory', 'Hang Time');

% Display hang time
disp(['Hang time: ', num2str(hang_time), ' seconds']);

% Plot the residuals from the bisection method
figure; % Create a new figure for residuals
semilogy(1:length(resarray), resarray, 'b-o'); % Plot residuals with a logarithmic scale on the y-axis
grid on;
xlabel('Iteration');
ylabel('Residual');
title('Hang Time Bisection Method Residuals');