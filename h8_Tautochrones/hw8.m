% brachistochrones
%https://www.youtube.com/watch?v=skvnj67YGmw
R = 2; % Radius in meters
theta = linspace(0, 2 * pi, 1000); % Parameterized angle

% Cycloid parameterization
x = R * (theta - sin(theta));
y = R * (cos(theta) - 1);

% Plot the cycloidal arc
figure;
plot(x, y, 'b-', 'LineWidth', 2);
hold on;
xlabel('x (meters)');
ylabel('y (meters)');
title('Cycloidal Arc for the Frictionless Slide');
grid on;
axis equal;

% Simulation parameters
g = 9.8; % Gravity (m/s^2)
phi0 = [pi/6, 2*pi/6, 3*pi/6, 4*pi/6, 5*pi/6];  % Starting angles
Ntps = 100; % Improved Euler timesteps per second
t0 = 0; % Initial time
tf = 2; % Final time (in seconds)
%Nt = ceil(Ntps * (tf - t0)); % Number of time steps
colors = ['r', 'g', 'b', 'm', 'c'];  % Colors for each ball


% Calculate hang times for each starting angle
hang_times = zeros(size(phi0));
for i = 1:length(phi0)
    hang_times(i) = find_hang_time(R, phi0(i), Ntps);
end
t_b = max(hang_times);  % Use the maximum hang time to define the period

phi0_degrees = phi0 * (180/pi);

% Create the plot
figure;
plot(phi0_degrees, hang_times, '-o', 'LineWidth', 2, 'MarkerSize', 8, 'MarkerFaceColor', 'b');
xlabel('Starting Angle \phi_0 (degrees)');
ylabel('Time to Reach Bottom (seconds)');
title('Hang Time vs. Starting Angle');
grid on;


figure;
hold on;
axis equal;
xlim([-R, R]);
ylim([-R, R]);
title('Cycloid Slide Animation');
xlabel('x');
ylabel('y');

theta = linspace(0, 2*pi, 1000);
x_cycloid = R * (theta - sin(theta));
y_cycloid = -R * (1 - cos(theta));
plot(x_cycloid, y_cycloid, 'k', 'LineWidth', 2);  % Draw the cycloid path

% Create plot handles for each ball
balls = gobjects(1, length(phi0));
for i = 1:length(phi0)
    balls(i) = plot(NaN, NaN, 'o', 'MarkerFaceColor', colors(i), 'MarkerEdgeColor', 'k', 'MarkerSize', 10);
end

% Animation loop        %% travel's in opposite direction
t_final = 4*2*pi %4 * t_b;  % Duration of the animation (4 periods) period is not the hangtime
dt = 1 / Ntps;
t = 0:dt:t_final;

for k = 1:length(t)
    for i = 1:length(phi0)
        if t(k) <= hang_times(i)
            % Calculate position along the cycloid
            v = [phi0(i); 0];  % Initial conditions for each ball
            [pos, ~] = improvedEuler(@(t, v) obj_func(t, R, phi0(i), Ntps), v, 0, t(k), 50);
            x = R * (pos(1, end) - sin(pos(1, end)));
            y = -R * (1 - cos(pos(1, end)));
            set(balls(i), 'XData', x, 'YData', y);
        end
    end
    drawnow;
end
