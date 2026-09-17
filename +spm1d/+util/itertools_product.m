function [A] = itertools_product(a, n)
%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky


%%% create sign permutations:
N     = 2^n;
A     = zeros(N, n);
for i=1:n
    aa  = sort( repmat(a, [1, 2^(i-1)]) );
    col = repmat(aa, [1, 2^(n-i)]);
    A(:,n-i+1) = col;
end

