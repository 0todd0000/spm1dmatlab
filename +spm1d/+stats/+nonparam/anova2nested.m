function [SnPM] = anova2nested(y, A, B, varargin)
%__________________________________________________________________________
% Copyright (C) 2022 Todd Pataky


roi_found = any(   cellfun(@(c)(isequal(lower(c),'roi')), varargin(1:end:2))   );
if roi_found
    error('[spm1d error]  "roi" analysis is not supported for nonparametric procedures.')
end


y         = spm1d.util.flatten(y);
if isvector(y)
    perm  = spm1d.stats.nonparam.permuters.PermuterANOVA2nested_0D(y, A, B);
else
    perm  = spm1d.stats.nonparam.permuters.PermuterANOVA2nested_1D(y, A, B);
end
SnPM      = spm1d.stats.nonparam.snpm.build_snpm('F', perm);

