x = linspace(1,2,1000);
N = 9;
a = 1;
b = 2;
C = orthpoly(N,a,b);    % preallocate cellular array size n+1 x 1
legend_str = cell(N+1,1);

% Display the polynomials reults (orthonormal over the interval [a,b]
for k = 1:length(C)
    disp(['P_', num2str(k-1), ' = ', mat2str(C{k})]);
end


% PLOT LEGENDRE POLYNOMIALS FROM k = 0 TO 9 AND ADD LEGEND
figure(1); hold on;
for k = 0:N
    plot(x,polyval(C{k+1},x),'-', 'linewidth', 3);  %evaluated at x
    legend_str{k+1} = ['m_{' int2str(k) '}(x) = x^{' int2str(k) '}'];
end

legend(legend_str, 'Location','EastOutside', 'fontsize',12)
xlabel('x')
ylabel('m_k(x) = x^k')