function [SnPM] = manova1(y, A, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ttest.m 1 2016-01-04 16:07 todd $

parser        = inputParser;
addOptional(parser, 'roi', [], @isnumeric);
parser.parse(varargin{:});
roi           = parser.Results.roi;

perm  = spm1d.stats.nonparam.permuters.PermuterMANOVA10D(y, A);
SnPM  = spm1d.stats.nonparam.snpm.build_snpm('X2', perm);

