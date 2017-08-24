function [SPM] = ttest(Y, varargin)
% One-sample t test (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.ttest(y)
% [spm] = spm1d.stats.ttest(y, mu)
% [spm] = spm1d.stats.ttest(y, 'mu', mu)
% [spm] = spm1d.stats.ttest(y, 'mu', mu, 'roi', roi)
%
% y     - (J x Q) data array
%         J - number of responses
%         Q - number of continuum nodes
% mu    - (1 x Q) datum {default: zeros(1,Q)}
% roi   - (1 x Q) region of interest {1D data only}
%
% spm   - statistical parametric map object
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky


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