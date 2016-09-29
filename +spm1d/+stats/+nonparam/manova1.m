function [SnPM] = manova1(y, A, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


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

