function [y] = flatten(y)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


if isvector(y)
    y = y(:);
end


