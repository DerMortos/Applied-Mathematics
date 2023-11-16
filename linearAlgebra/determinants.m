% Find the vaues of h for which the vectors are linearly dependent
v1 = [1; -1; 4];
v2 = [3; -5; 7];

% declare anonymous function
determinantFunction  = @(h) det([v1,v2,[-1; 5; h]]);

h_value = fzero(determinantFunction, 0);
disp(['The value of h for which the vectors are linearly dependent is: ', ...
                        num2str(h_value)]);