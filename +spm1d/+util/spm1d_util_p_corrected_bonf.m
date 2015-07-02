function [pBonf] = spm1d_util_p_corrected_bonf(p, n)

% Copyright (C) 2014  Todd Pataky
% Version: M0.1 (2014/05/01)

if p <= 0
    pBonf  = 0;
elseif p >= 1
    pBonf  = 1;
else
    pBonf  = 1 - (1-p)^(n);
    pBonf  = max(0, min(1,pBonf));
end
    