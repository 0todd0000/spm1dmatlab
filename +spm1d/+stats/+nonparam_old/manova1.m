function [SnPM] = manova1(y, A, varargin)
%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky

roi_found = any(   cellfun(@(c)(isequal(lower(c),'roi')), varargin(1:end:2))   );
if roi_found
    error('[spm1d error]  "roi" analysis is not supported for nonparametric procedures.')
end

parser        = inputParser;
addOptional(parser, 'roi', [], @isnumeric);
parser.parse(varargin{:});
% roi           = parser.Results.roi;

if ndims(y)==2 %#ok<ISMAT>
    perm  = spm1d.stats.nonparam_old.permuters.PermuterMANOVA1_0D(y, A);
else
    perm  = spm1d.stats.nonparam_old.permuters.PermuterMANOVA1_1D(y, A);
end
SnPM      = spm1d.stats.nonparam_old.snpm.build_snpm('X2', perm);

