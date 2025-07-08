function [SnPM] = regress(y, x, varargin)
%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky


roi_found = any(   cellfun(@(c)(isequal(lower(c),'roi')), varargin(1:end:2))   );
if roi_found
    error('[spm1d error]  "roi" analysis is not supported for nonparametric procedures.')
end


[y,x] = deal( spm1d.util.flatten(y), spm1d.util.flatten(x));

spm1d.util.check_zero_var(y);

if isvector(y)
    perm  = spm1d.stats.nonparam_old.permuters.PermuterRegress_0D(y, x);
else
    perm  = spm1d.stats.nonparam_old.permuters.PermuterRegress_1D(y, x);
end
SnPM  = spm1d.stats.nonparam_old.snpm.build_snpm('T', perm);

