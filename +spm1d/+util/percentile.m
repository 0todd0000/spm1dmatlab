function [x] = percentile(Z, perc)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



if ~isvector(Z)
    n = size(Z,2);
    x  = zeros(1, n);
    for i = 1:n
        x(i) = spm1d.util.percentile( Z(:,i), perc );
    end
    return
end


Z              = sort(Z);
n              = numel(Z);
nperc          = numel(perc);
ind            = zeros(nperc);
for i = 1:nperc
    if perc(i) >= 50
        ind(i) = floor(0.01 * perc(i) * n);
    else
        ind(i) = ceil(0.01 * perc(i) * n);
    end
end
ind(ind==0)    = 1;
ind(ind==n)    = n-1;
x              = zeros(1,nperc);
for i = 1:nperc
    x(i)       = mean( Z( ind(i) : ind(i)+1 ) );
end

