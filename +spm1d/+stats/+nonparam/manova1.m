function [SnPM] = manova1(y, A, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ttest.m 1 2016-01-04 16:07 todd $

parser        = inputParser;
addOptional(parser, 'roi', [], @isnumeric);
parser.parse(varargin{:});
% roi           = parser.Results.roi;

if ndims(y)==2 %#ok<ISMAT>
    perm  = spm1d.stats.nonparam.permuters.PermuterMANOVA1_0D(y, A);
else
    perm  = spm1d.stats.nonparam.permuters.PermuterMANOVA1_1D(y, A);
end
SnPM      = spm1d.stats.nonparam.snpm.build_snpm('X2', perm);

