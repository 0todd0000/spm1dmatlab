function [SPM] = ttest(Y, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ttest.m 1 2016-01-04 16:07 todd $

parser        = inputParser;
addOptional(parser, 'mu', 0,  @(x)isnumeric(x) );
parser.parse(varargin{:});
mu            = parser.Results.mu;

Y             = spm1d.util.flatten(Y - mu);
[J,~]         = size(Y);
X             = ones(J, 1);
c             = 1;
[SPM]         = spm1d.stats.glm(Y, X, c, varargin{:});