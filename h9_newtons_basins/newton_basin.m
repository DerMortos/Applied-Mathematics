function C = newton_basin(c, rlim, ilim, ng, N)

x = linspace(rlim(1), rlim(2), ng);
y = linspace(ilim(1), ilim(2), ng);
[X,Y] = meshgrid(x,y);

% creates grid of complex numbers
Z = X + 1i * Y;

%polynomial and derivativee functions
dc = polyder(c);
p = @(x) polyval(c,x);
der_p = @(x) polyval(dc,x);


Xn = newton_simple(p, der_p, Z, N);

% find the zeros (basins)
C = zeros(size(Xn));
r = roots(c);

for l = 1:length(r)
    C = C + l * (abs(Xn - r(l)) < 1e-6);   %if within tol mul by l root
end

cmap = [0 0 0
        jet(length(r))];

% plot the basins of attraction
figure(1);  hold on;
imagesc(x,y,C);
colormap(cmap);
title(mypoly2str(c,'x'));

end

