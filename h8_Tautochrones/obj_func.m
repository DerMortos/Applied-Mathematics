function f = obj_func(t, R, phi_0, Ntps)

g = 9.81; % acceleration due to gravity in m/s^2

% Define the system of ODEs
F = @(t,V) [V(2); ...
           (-sin(V(1))*(R*V(2)^2 - g))/(2*R*(1 - cos(V(1))))];

% Initial conditions
V0 = [phi_0; 0];

% Time span
t0 = 0;
tf = t;

% Number of time steps, scaled by the number of timesteps per second (Ntps)
Nt = ceil(Ntps * (tf - t0));

% Solve the ODE using the Improved Euler method
[V, ~] = iEuler(F, V0, t0, tf, Nt);

% The objective function is the difference between the final angle and pi
f = V(1,end) - pi;
end

