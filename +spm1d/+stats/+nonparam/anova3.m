function [SnPM] = anova3(y, A, B, C, varargin)
%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky

roi_found = any(   cellfun(@(c)(isequal(lower(c),'roi')), varargin(1:end:2))   );
if roi_found
    error('[spm1d error]  "roi" analysis is not supported for nonparametric procedures.')
end

% parser        = inputParser;
% addOptional(parser, 'roi', [], @isnumeric);
% parser.parse(varargin{:});
% roi           = parser.Results.roi;

y         = spm1d.util.flatten(y);
if isvector(y)
    perm  = spm1d.stats.nonparam.permuters.PermuterANOVA3_0D(y, A, B, C);
else
    perm  = spm1d.stats.nonparam.permuters.PermuterANOVA3_1D(y, A, B, C);
end
SnPM      = spm1d.stats.nonparam.snpm.build_snpm('F', perm);
