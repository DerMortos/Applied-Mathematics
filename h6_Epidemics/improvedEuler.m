function [y, t] = improvedEuler(func, v0, t0,tf,Nt)
% create vector of linearly spaced time points
t = linspace(t0,tf,Nt+1);

% calculate the time steps size to fit across entire timespan
h = (tf - t0)/Nt;

%initializing matrix with zeroes (we can discern the size from initial v0)
y = zeros(length(v0) ,Nt + 1); 
y(:,1) = v0;    % initial condition

% iterate to compute successive approximation for k=1:Nt
for k = 1:Nt
    % predictor step: t(k+1)
    e = y(:,k) + h*func(t(k),y(:,k));
    
    % corrector step: avg of the derivatives at t(k) and t(k+1)
    y(:,k+1) = y(:,k) + (h/2)*(func(t(k),y(:,k)) + func(t(k+1), e));
end