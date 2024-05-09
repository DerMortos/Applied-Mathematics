function f = obj_func(t, R, phi_0, Ntps)
    % find the time it takes to reach the bottom
    g = 9.8;
    func = @(t, v) [v(2); ((sin(v(1)) * (g - R * v(2)^2)) / (2 * R * (1 - cos(v(1)))))];
    v = [phi_0; 0];    %% Initial conditions
   
    % Time span
    t0 = 0;
    tf = t;
    
    % Number of time steps, scaled by the number of timesteps per second (Ntps)
    Nt = ceil(Ntps * (tf - t0));

    v = improvedEuler(func, v, t0, tf, Nt);
    % solution is difference between the final angle and pi
    f = v(1, end) - pi;
end



