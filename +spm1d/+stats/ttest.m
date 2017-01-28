function [SPM] = ttest(Y, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


parser        = inputParser;
addOptional(parser, 'mu',  0,   @(x)isnumeric(x) );
addOptional(parser, 'roi', [],  @(x)isempty(x) || ((islogical(x)|| isnumeric(x)) && isvector(x))   );
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