function [p] = spm1d_util_p_critical_bonf(alpha, n)

% Copyright (C) 2014  Todd Pataky
% Version: M0.1 (2014/05/01)

if alpha <= 0
    p  = 0;
elseif alpha >= 1
    p  = 1;
else
    p  = 1 - (1-alpha)^(1/n);
end
    