function [p] = spm1d_util_p_critical_bonf(alpha, n)

%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



if alpha <= 0
    p  = 0;
elseif alpha >= 1
    p  = 1;
else
    p  = 1 - (1-alpha)^(1/n);
end
    