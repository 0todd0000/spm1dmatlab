function [y] = flatten(y)
%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky


if isvector(y)
    y = y(:);
end


