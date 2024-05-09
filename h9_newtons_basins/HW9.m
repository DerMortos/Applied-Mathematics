
% Define a polynomial coefficient vector (3x^4 - 2x^3 + x^2 - x + 1)
coeffs = [3, -2, 1, -1, 1];

% Generate the polynomial string with 'x' as the variable
[s, len] = mypoly2str(coeffs, 'x');

% Print the output
disp('Formatted Polynomial String:');
disp(s);
disp('Line Lengths:');
disp(len);

% basin 1
c = [1 0 0 0 -1];
rlim = [-2 2];
ilim = [-2 2];
ng = 1024;
N = 20;

C = newton_basin(c, rlim, ilim, ng, N);


% basin 2
c = [1 0 -.84 0 -.16];
rlim = [.15 .8];
ilim = [-.25 .25];
ng = 1024;
N = 20;

C = newton_basin(c, rlim, ilim, ng, N);


% basin 3
c = randi(9,1,randi(9,1))
rlim = [-1 1];
ilim = [-1 1];
ng = 1024;
N = 20;

C = newton_basin(c, rlim, ilim, ng, N);
