function [SnPM] = anova3nested(y, A, B, C, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


parser        = inputParser;
addOptional(parser, 'roi', [], @isnumeric);
parser.parse(varargin{:});
% roi           = parser.Results.roi;

y         = spm1d.util.flatten(y);
if isvector(y)
    perm  = spm1d.stats.nonparam.permuters.PermuterANOVA3nested_0D(y, A, B, C);
else
    perm  = spm1d.stats.nonparam.permuters.PermuterANOVA3nested_1D(y, A, B, C);
end
SnPM      = spm1d.stats.nonparam.snpm.build_snpm('F', perm);
