function [SnPM] = anova1(y, A, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


parser        = inputParser;
addOptional(parser, 'roi', [], @isnumeric);
parser.parse(varargin{:});
% roi           = parser.Results.roi;


y     = spm1d.util.flatten(y);
if isvector(y)
    perm  = spm1d.stats.nonparam.permuters.PermuterANOVA1_0D(y, A);
else
    perm  = spm1d.stats.nonparam.permuters.PermuterANOVA1_1D(y, A);
end
SnPM  = spm1d.stats.nonparam.snpm.build_snpm('F', perm);

