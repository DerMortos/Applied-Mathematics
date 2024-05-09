%initial parameter values
t0 = 0;
c = 100;
q = 0.001;
gamma = 1/30;
delta = 1/30;   % 30,000 deaths per million
beta = c*q;
P = 3 * 10^8;
ymin = 10^-5;
xmax = 750;

% RATE EQUATION
F = @(t,x) [-(beta*x(1)*x(2))/P;...            
            ((beta*x(1)*x(2))/P) - (delta + gamma)*x(2);...
            gamma * x(2);...
            delta * x(2)];
        
% TIME STEPPING PARAMETERS
v0 = [P-100, 100, 0, 0];
tf = 730;
Nt = 1460;   %number of steps(approximations)

% call time stepping algorithm
[x, t] = improvedEuler(F,v0,t0,tf,Nt);

% plot figure 1
figure(1); clf;  axis tight;
semilogy(t,x(1,:),'b-', 'linewidth',3)
hold on;
ylim([ymin 10^10]);
xlim([0 xmax]);
semilogy(t,x(2,:),'k--', 'linewidth',3)
semilogy(t,x(3,:), 'g-', 'linewidth', 3)
semilogy(t,x(4,:), 'r--', 'linewidth', 3)

title({'Original Homework Parameters:','No actions taken during outbreak'}, 'fontsize',16)
xlabel('Time in Days')
ylabel('Population change')
l = legend('susceptible population', 'Infected Population',...
        'Recovered Population', 'Number of Deaths', 'location', 'southeast');
l.FontSize = 16;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OPTION 1

c = 90;
% delta
deltaOpt1 = @(t) ((1/30).*(1 - heaviside(t-c)) + ...
         (1/150)*heaviside(t-c));   
% gamma
gammaOpt1 = @(t) ((1/30).*(1 - heaviside(t-c)) + ...
         (9/150)*heaviside(t-c)); 
     
% RATE EQUATION
F = @(t,x) [-(beta*x(1)*x(2))/P;...            
            ((beta*x(1)*x(2))/P) - (deltaOpt1(t) + gammaOpt1(t))*x(2);...
            gammaOpt1(t) * x(2);...
            deltaOpt1(t) * x(2)];

% recalculate
[x, t] = improvedEuler(F,v0,t0,tf,Nt);

% plot figure 2
figure(2); clf; axis tight;
semilogy(t,x(1,:),'b-', 'linewidth',3)
hold on;
ylim([ymin 10^10]);
xlim([0 xmax]);
semilogy(t,x(2,:),'k--', 'linewidth',3)
semilogy(t,x(3,:), 'g-', 'linewidth', 3)
semilogy(t,x(4,:), 'r--', 'linewidth', 3)

title({'Option 1:','Treatment developed so that 90% of population recovers'}, 'fontsize',16)
xlabel('Time in Days')
ylabel('Population change')
l =legend('susceptible population', 'Infected Population',...
        'Recovered Population', 'Number of Deaths', 'location', 'southeast');
l.FontSize = 16;     


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OPTION 2

c = 30;
% c(t)
cOpt2 = @(t) ((100 - (5*t)/3).*(1 - heaviside(t-c)) + ...
         50*heaviside(t-c));
% q(t)
qOpt2 = @(t) ((0.001-(0.0005*t)/30).*(1 - heaviside(t-c)) + ...
         (0.0005)*heaviside(t-c));      
% beta
betaOpt2 = @(t) (cOpt2(t) .* qOpt2(t));

% RATE EQUATION
F = @(t,x) [-(betaOpt2(t)*x(1)*x(2))/P;...            
            ((betaOpt2(t)*x(1)*x(2))/P) - (delta + gamma)*x(2);...
            gamma * x(2);...
            delta * x(2)];
        
% recalculate        
[x, t] = improvedEuler(F,v0,t0,tf,Nt);

% plot
figure(3); clf;  axis tight;
semilogy(t,x(1,:),'b-', 'linewidth',3)
hold on;
xlim([0 xmax]);
ylim([ymin 10^10]);
semilogy(t,x(2,:),'k--', 'linewidth',3)
semilogy(t,x(3,:), 'g-', 'linewidth', 3)
semilogy(t,x(4,:), 'r--', 'linewidth', 3)

title({'Option 2:','Hand washing & Social Distancing Campaign', 'Along with Strict 30 Day Quarantine'}, 'fontsize',16)
xlabel('Time in Days')
ylabel('Population change')
l = legend('susceptible population', 'Infected Population',...
        'Recovered Population', 'Number of Deaths', 'location', 'southeast');
l.FontSize = 16;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Final Presentation
%Covid-19
%4/10/2020

% infection rate:   14%
% death rate:       20%
% recovery rate     80%
t0 = 0;
c = 100;        % Average nuber of contacts per individual per day
q = 1/70;      % Likelyhood infection contact results in transmission
gamma = 1/5;     % Per capita death rate
delta = 4/5;   % Per capita recovery rate
beta = c*q;     % Transmission rate
P = 1377861;  % Total population at onset of outbreak
ymin = 10^-5;
xmax = 750;

% TIME STEPPING PARAMETERS
v0 = [P-747, 747, 0, 0];    % [initial pop - infected, infected, recovered, deaths]
tf = 730;
Nt = 1460;   %number of steps(approximations)

% call time stepping algorithm
[x, t] = improvedEuler(F,v0,t0,tf,Nt);

% plot figure 4
figure(4); clf;  axis tight;
semilogy(t,x(1,:),'b-', 'linewidth',3)
hold on;
xlim([0 xmax]);
ylim([ymin 10^10]);
semilogy(t,x(2,:),'k--', 'linewidth',3)
semilogy(t,x(3,:), 'g-', 'linewidth', 3)
semilogy(t,x(4,:), 'r--', 'linewidth', 3)

title({'Covid-19:','No actions taken during outbreak'}, 'fontsize',16)
xlabel('Time in Days')
ylabel('Population change')
l = legend('susceptible population', 'Infected Population',...
        'Recovered Population', 'Number of Deaths', 'location', 'southeast');
l.FontSize = 16;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OPTION 1
% Treatment developed so that 90% of population recovers


d = 90; %number of t days
% delta
deltaOpt1 = @(t) ((4/5).*(1 - heaviside(t-d)) + ...
         (1/150)*heaviside(t-d));   
% gamma
gammaOpt1 = @(t) ((1/5).*(1 - heaviside(t-c)) + ...
         (9/150)*heaviside(t-d)); 
     
% RATE EQUATION
F = @(t,x) [-(beta*x(1)*x(2))/P;...            
            ((beta*x(1)*x(2))/P) - (deltaOpt1(t) + gammaOpt1(t))*x(2);...
            gammaOpt1(t) * x(2);...
            deltaOpt1(t) * x(2)];

% recalculate
[x, t] = improvedEuler(F,v0,t0,tf,Nt);

% plot figure 2
figure(5); clf; axis tight;
semilogy(t,x(1,:),'b-', 'linewidth',3)
hold on;
xlim([0 750]);
ylim([ymin 10^10]);
semilogy(t,x(2,:),'k--', 'linewidth',3)
semilogy(t,x(3,:), 'g-', 'linewidth', 3)
semilogy(t,x(4,:), 'r--', 'linewidth', 3)

title({'Option 1:','Treatment developed so that 90% of population recovers'}, 'fontsize',16)
xlabel('Time in Days')
ylabel('Population change')
l =legend('susceptible population', 'Infected Population',...
        'Recovered Population', 'Number of Deaths', 'location', 'southeast');
l.FontSize = 16;  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OPTION 2
% Hand Washing & Social Distancing Campaign Along with Strict 30 Day Quarantine

d = 30; % number of t days 
% c(t)
cOpt2 = @(t) ((747 - (5*t)/3).*(1 - heaviside(t-d)) + ...
         50*heaviside(t-c));
% q(t)
qOpt2 = @(t) ((0.001-(0.0005*t)/30).*(1 - heaviside(t-d)) + ...
         (0.0005)*heaviside(t-d));      
% beta
betaOpt2 = @(t) (cOpt2(t) .* qOpt2(t));

% RATE EQUATION
F = @(t,x) [-(betaOpt2(t)*x(1)*x(2))/P;...            
            ((betaOpt2(t)*x(1)*x(2))/P) - (delta + gamma)*x(2);...
             gamma * x(2);...
            delta * x(2)];
        
% recalculate        
[x, t] = improvedEuler(F,v0,t0,tf,Nt);

% plot
figure(6); clf;  axis tight;
semilogy(t,x(1,:),'b-', 'linewidth',3)
hold on;
xlim([0 xmax]);
ylim([ymin 10^10]);
semilogy(t,x(2,:),'k--', 'linewidth',3)
semilogy(t,x(3,:), 'g-', 'linewidth', 3)
semilogy(t,x(4,:), 'r--', 'linewidth', 3)

title({'Option 2:','Hand Washing & Social Distancing Campaign', 'Along with Strict 30 Day Quarantine'}, 'fontsize',16)
xlabel('Time in Days')
ylabel('Population change')
l = legend('susceptible population', 'Infected Population',...
        'Recovered Population', 'Number of Deaths', 'location', 'southeast');
l.FontSize = 16;




