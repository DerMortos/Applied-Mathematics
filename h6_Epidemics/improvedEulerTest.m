m = 10;
gamma = 0.1;
t0 = 0;
y0 = 1;
g = 9.8;
v0= 100;
theta = pi/4;

%RATE EQUATION
%has two inputs from h(func) in my euler
% x(2) accesses x from @(t,x)
F = @(t,x) [x(2); -g - gamma/m * x(2)];

%TIME STEPPING PARAMETERS
x0 = [y0; v0*sin(theta)];
tf = 15;
Nt = 1000;   %number of steps(approximations)

%call time stepping algorithm
[x, t] = improvedEuler(F,x0,t0,tf,Nt);

%GIVE FORMULA FOR EXACT SOLUTION
t = linspace(t0,tf,Nt+1);
y = @(t)    (m*v0*sin(theta)/gamma + g*m^2/(gamma^2)) * ...
            (1 - exp(-gamma/m * (t-t0))) - g*m/gamma * (t-t0) + y0;
v = @(t)    (m*v0*sin(theta)/gamma + g*m^2/(gamma^2)) * ...
            (gamma/m * exp(-gamma/m * (t-t0)))- g*m/gamma;

figure(1); clf; hold on;
plot(t,y(t),'r-', 'linewidth',3)
%plots are superimposed, but bc bottom is k--
%plot underneath shows through
plot(t,x(1,:),'k--', 'linewidth',3)
xlabel('time (seconds)')
ylabel('height of projectile (meters)')
legend('Actual Solution', 'Euler Approximation')

figure(2); clf; hold on;
plot(t,v(t),'b-', 'linewidth',3)
plot(t,x(2,:),'k--', 'linewidth',3)
xlabel('time (seconds)')
ylabel('height of projectile (meters)')
%legend('Actual Solution', 'Euler Approximation')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

m = 10;
gamma = 0.1;
t0 = 0;
y0 = 1;
g = 9.8;
v0= 100;
theta = pi/4;

%RATE EQUATION
%has two inputs from h(func) in my euler
F = @(t,x) [x(2);...            
            -g - gamma/m * x(2)];
%TIME STEPPING PARAMETERS
x0 = [y0; ...
    v0*sin(theta)];
tf = 15;
Nt = 100;   %number of steps(approximations)

%call time stepping algorithm
x = improvedEuler(F,x0,t0,tf,Nt);

%GIVE FORMULA FOR EXACT SOLUTION
 t = linspace(t0,tf,Nt+1);
% y = @(t)    (m*v0*sin(theta)/gamma + g*m^2/(gamma^2)) * ...
%             (1 - exp(-gamma/m * (t-t0))) - g*m/gamma * (t-t0) + y0;
% v = @(t)    (m*v0*sin(theta)/gamma + g*m^2/(gamma^2)) * ...
%             (gamma/m * exp(-gamma/m * (t-t0)))- g*m/gamma;

figure(3); clf; hold on;
%plot(t,y(t),'r-', 'linewidth',3)
plot(t,x(1,:),'k--', 'linewidth',3)
xlabel('time (seconds)')
ylabel('height of projectile (meters)')
%legend('Actual Solution', 'Euler Approximation')

figure(4); clf; hold on;
%plot(t,v(t),'r-', 'linewidth',3)
plot(t,x(2,:),'k--', 'linewidth',3)
xlabel('time (seconds)')
ylabel('height of projectile (meters)')
%legend('Actual Solution', 'Euler Approximation')