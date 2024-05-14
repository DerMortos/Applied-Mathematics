function C = newton_basin(c, rlim, ilim, ng, N)
% algorithm using bisect method to illustrate which initial guesses converge to which roots and which converge to no root

x = linspace(rlim(1), rlim(2), ng); % create vector of linearly spaced points (real axis)
y = linspace(ilim(1), ilim(2), ng); % create vector of linearly spaced points (imaginary axis)
[X,Y] = meshgrid(x,y);              % for complex grid 'Z' from (x,y)

% creates grid of complex numbers
Z = X + 1i * Y;

%polynomial and derivativee functions
dc = polyder(c);            % derivative coefficient
p = @(x) polyval(c,x);      % polynomial function
der_p = @(x) polyval(dc,x); % derivative function


Xn = newton_simple(p, der_p, Z, N);

% find the zeros (basins)
C = zeros(size(Xn));
r = roots(c);

for l = 1:length(r)
    C = C + l * (abs(Xn - r(l)) < 1e-6);   %if within tol mul by l root
end

cmap = [0 0 0               % black for non-converging points
        jet(length(r))];    % cmap for roots

% plot the basins of attraction
figure(1); 
hold on;
imagesc(x,y,C);
colormap(cmap);
title(mypoly2str(c,'x'));

end

