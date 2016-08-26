function [SPM] = ttest(Y, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ttest.m 1 2016-01-04 16:07 todd $

parser        = inputParser;
addOptional(parser, 'mu',  0,   @(x)isnumeric(x) );
addOptional(parser, 'roi', [],  @(x)isnumeric(x) );
parser.parse(varargin{:});
mu            = parser.Results.mu;
roi           = parser.Results.roi;


Y             = spm1d.util.flatten(Y);
[J,~]         = size(Y);
if numel(mu)>1
    mu        = repmat(mu, [J 1]);
end
Y             = Y - mu;
X             = ones(J, 1);
c             = 1;
[SPM]         = spm1d.stats.glm(Y, X, c, 'roi',roi);