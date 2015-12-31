function [pBonf] = spm1d_util_p_corrected_bonf(p, n)

%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: spm1d_util_p_corrected_bonf.m 1 2016-01-04 16:07 todd $


if p <= 0
    pBonf  = 0;
elseif p >= 1
    pBonf  = 1;
else
    pBonf  = 1 - (1-p)^(n);
    pBonf  = max(0, min(1,pBonf));
end
    