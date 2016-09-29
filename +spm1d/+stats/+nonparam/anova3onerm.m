function [SnPM] = anova3onerm(y, A, B, C, SUBJ, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


parser        = inputParser;
addOptional(parser, 'roi', [], @isnumeric);
parser.parse(varargin{:});
% roi           = parser.Results.roi;

y         = spm1d.util.flatten(y);
if isvector(y)
    perm  = spm1d.stats.nonparam.permuters.PermuterANOVA3onerm_0D(y, A, B, C, SUBJ);
else
    perm  = spm1d.stats.nonparam.permuters.PermuterANOVA3onerm_1D(y, A, B, C, SUBJ);
end
SnPM      = spm1d.stats.nonparam.snpm.build_snpm('F', perm);

