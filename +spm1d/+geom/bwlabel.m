function [L,n] = bwlabel(b)

%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: bwlabel.m 1 2016-01-04 16:07 todd $


Q      = numel(b);
d      = diff(b);
i0     = 1 + find(d==+1);
i1     = find(d==-1);

if b(1)
    i0 = [1 i0];
end
if b(end)
    i1 = [i1 numel(b)];
end

n      = numel(i0);
L      = zeros(1, Q);
for i=1:n
    L(i0(i):i1(i)) = i;
end

