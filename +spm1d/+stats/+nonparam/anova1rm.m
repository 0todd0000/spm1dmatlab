function [SnPM] = anova1rm(y, A, SUBJ, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


parser        = inputParser;
addOptional(parser, 'roi', [], @isnumeric);
parser.parse(varargin{:});
% roi           = parser.Results.roi;

y     = spm1d.util.flatten(y);
if isvector(y)
    perm  = spm1d.stats.nonparam.permuters.PermuterANOVA1rm_0D(y, A, SUBJ);
else
    perm  = spm1d.stats.nonparam.permuters.PermuterANOVA1rm_1D(y, A, SUBJ);
end
SnPM  = spm1d.stats.nonparam.snpm.build_snpm('F', perm);
