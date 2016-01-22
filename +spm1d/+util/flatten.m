function [y] = flatten(y)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: flatten.m 1 2016-01-22 10:22 todd $

if isvector(y)
    y = y(:);
end


