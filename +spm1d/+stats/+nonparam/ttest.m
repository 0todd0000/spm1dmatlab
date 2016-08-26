function [SnPM] = ttest(y, varargin)
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
perm  = spm1d.stats.nonparam.permuters.PermuterTtest0D(y, mu);


SnPM = spm1d.stats.nonparam.snpm.build_snpm('T', perm);

% spm1d.stats.nonparam.SnPM0D('T', perm, 'isinlist',false);







% [SPM]         = spm1d.stats.glm(Y, X, c, 'roi',roi);