function [SnPM] = anova1rm(y, A, SUBJ, varargin)
%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



roi_found = any(   cellfun(@(c)(isequal(lower(c),'roi')), varargin(1:end:2))   );
if roi_found
    error('[spm1d error]  "roi" analysis is not supported for nonparametric procedures.')
end



y     = spm1d.util.flatten(y);
if isvector(y)
    perm  = spm1d.stats.nonparam_old.permuters.PermuterANOVA1rm_0D(y, A, SUBJ);
else
    perm  = spm1d.stats.nonparam_old.permuters.PermuterANOVA1rm_1D(y, A, SUBJ);
end
SnPM  = spm1d.stats.nonparam_old.snpm.build_snpm('F', perm);
