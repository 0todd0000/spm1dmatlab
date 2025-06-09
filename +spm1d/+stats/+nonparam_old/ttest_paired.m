function [SnPM] = ttest_paired(yA, yB, varargin)
%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky

roi_found = any(   cellfun(@(c)(isequal(lower(c),'roi')), varargin(1:end:2))   );
if roi_found
    error('[spm1d error]  "roi" analysis is not supported for nonparametric procedures.')
end

SnPM = spm1d.stats.nonparam.ttest(yA - yB, 0, varargin{:});
