function [SnPM] = hotellings(y, varargin)
%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky

roi_found = any(   cellfun(@(c)(isequal(lower(c),'roi')), varargin(1:end:2))   );
if roi_found
    error('[spm1d error]  "roi" analysis is not supported for nonparametric procedures.')
end

parser        = inputParser;
addOptional(parser, 'mu',  0,   @(x)isnumeric(x) );
% addOptional(parser, 'roi', [],  @(x)isnumeric(x) );
parser.parse(varargin{:});
mu            = parser.Results.mu;
% roi           = parser.Results.roi;

y     = spm1d.util.flatten(y);
if ndims(y)==2 %#ok<ISMAT>
    perm  = spm1d.stats.nonparam_old.permuters.PermuterHotellings_0D(y, mu);
else
    perm  = spm1d.stats.nonparam_old.permuters.PermuterHotellings_1D(y, mu);
end
SnPM  = spm1d.stats.nonparam_old.snpm.build_snpm('T2', perm);

