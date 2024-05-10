function a = polyadd(c,d)

    if length(c) < length(d)            % if length of c is less than d
        len = length(d) - length(c);
        c = [zeros(1,len) c];           % add zeroes at the beginning of c
    elseif length(d) < length(c)
        len = length(c) - length(d);
        d = [zeros(1,len) d];           % add zeroes at the beginning of d
    end

    a = c + d;
end