function [y] = flatten(y)
%__________________________________________________________________________
% Copyright (C) 2022 Todd Pataky


if isvector(y)
    y = y(:);
end


