function t = find_hang_time(R, phi_0, Ntps)
    % Function to compute the hang time using the objective function
    g = 9.8; % Gravity (m/s^2)
    func = @(t, v) [v(2); ((sin(v(1)) * (g - R * v(2)^2)) / (2 * R * (1 - cos(v(1)))))];
    v0 = [phi_0; 0];
    t0 = 0;
    tf = 2; % Upper limit for the time search

    % Use bisection method to find the time when the projectile reaches the bottom
    [t, ~] = bisect(@(t) obj_func(t, R, phi_0, Ntps), t0, tf, 1e-6, 40);
end