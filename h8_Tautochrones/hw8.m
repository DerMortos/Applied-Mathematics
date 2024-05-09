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
    Ntps = 100; % Improved Euler timesteps per second
    t0 = 0; % Initial time
    tf = 2; % Final time (in seconds)
    Nt = ceil(Ntps * (tf - t0)); % Number of time steps

    % Starting angles in radians (various positions)
    starting_angles = linspace(pi/20, 19*pi/20, 19);
    hang_times = zeros(size(starting_angles));

    % Simulation for each starting angle
    for i = 1:length(starting_angles)
        phi_0 = starting_angles(i);
        hang_times(i) = find_hang_time(R, phi_0, Ntps);
    end

    % Plot time to reach the bottom from each starting angle
    figure;
    plot(starting_angles, hang_times, 'r.-', 'LineWidth', 2);
    xlabel('Starting Angle (radians)');
    ylabel('Hang Time (seconds)');
    title('Time to Reach the Bottom of the Cycloidal Arc');
    grid on;


