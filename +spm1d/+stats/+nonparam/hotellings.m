function [SnPM] = hotellings(y, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ttest.m 1 2016-01-04 16:07 todd $

parser        = inputParser;
addOptional(parser, 'mu',  0,   @(x)isnumeric(x) );
% addOptional(parser, 'roi', [],  @(x)isnumeric(x) );
parser.parse(varargin{:});
mu            = parser.Results.mu;
% roi           = parser.Results.roi;

y     = spm1d.util.flatten(y);
if ndims(y)==2 %#ok<ISMAT>
    perm  = spm1d.stats.nonparam.permuters.PermuterHotellings_0D(y, mu);
else
    perm  = spm1d.stats.nonparam.permuters.PermuterHotellings_1D(y, mu);
end
SnPM  = spm1d.stats.nonparam.snpm.build_snpm('T2', perm);

