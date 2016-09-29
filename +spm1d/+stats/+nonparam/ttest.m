function [SnPM] = ttest(y, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


parser        = inputParser;
addOptional(parser, 'mu',  0,   @(x)isnumeric(x) );
% addOptional(parser, 'roi', [],  @(x)isnumeric(x) );
parser.parse(varargin{:});
mu            = parser.Results.mu;
% roi           = parser.Results.roi;

y     = spm1d.util.flatten(y);
if isvector(y)
    perm  = spm1d.stats.nonparam.permuters.PermuterTtest_0D(y, mu);
else
    perm  = spm1d.stats.nonparam.permuters.PermuterTtest_1D(y, mu);
end
SnPM  = spm1d.stats.nonparam.snpm.build_snpm('T', perm);

