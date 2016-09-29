function [A] = itertools_product(a, n)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


%%% create sign permutations:
N     = 2^n;
A     = zeros(N, n);
for i=1:n
    aa  = sort( repmat(a, [1, 2^(i-1)]) );
    col = repmat(aa, [1, 2^(n-i)]);
    A(:,n-i+1) = col;
end

