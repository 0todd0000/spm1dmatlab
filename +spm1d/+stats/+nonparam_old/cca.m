function [SnPM] = cca(y, x)
%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky

roi_found = any(   cellfun(@(c)(isequal(lower(c),'roi')), varargin(1:end:2))   );
if roi_found
    error('[spm1d error]  "roi" analysis is not supported for nonparametric procedures.')
end


spm1d.util.check_zero_var(y);
x     = spm1d.util.flatten(x);
if ndims(y)==2 %#ok<ISMAT>
    perm  = spm1d.stats.nonparam.permuters.PermuterCCA_0D(y, x);
else
    perm  = spm1d.stats.nonparam.permuters.PermuterCCA_1D(y, x);
end
SnPM  = spm1d.stats.nonparam.snpm.build_snpm('X2', perm);


