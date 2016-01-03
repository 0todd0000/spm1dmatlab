function [p] = spm1d_util_p_critical_bonf(alpha, n)

%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: spm1d_util_p_critical_bonf.m 1 2016-01-04 16:07 todd $


if alpha <= 0
    p  = 0;
elseif alpha >= 1
    p  = 1;
else
    p  = 1 - (1-alpha)^(1/n);
end
    