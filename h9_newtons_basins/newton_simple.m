function x = newton_simple(f,df,x,maxiter)
% simple implementation of netwon's method to find root starting at
% inital guess x0 then producing a series of appox. that approac sol.
for j = 1:maxiter
    x = x - f(x) ./ df(x);
end

