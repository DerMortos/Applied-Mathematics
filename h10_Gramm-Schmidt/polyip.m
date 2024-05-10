% HW 10

function ip = polyip(c,d,a,b)
    % compute the convolution of the two polynomial coefficient vectors (c, d)
    p = polyint(conv(c,d));

    % evaluate integral over interval [a, b]
    ip = diff(polyval(p,[a b]));

end