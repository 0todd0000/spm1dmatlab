function [SPM] = glm(Y, X, c, varargin)
% General linear model (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.glm(y, X, c)
% [spm] = spm1d.stats.glm(y, X, c, roi)
% [spm] = spm1d.stats.glm(y, X, c, 'roi', roi)
%
% y     - (J x Q) data array
%         J - number of responses
%         Q - number of continuum nodes
% X     - (J x M) design matrix
%         M - number of modeled terms
% c     - (1 x M) contrast vector
% roi   - (1 x Q) region of interest {1D data only}
%
% spm   - statistical parametric map object
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky


parser = inputParser;
addOptional(parser, 'roi',       [], @(x)isempty(x) || ((islogical(x)|| isnumeric(x)) && isvector(x))   );
parser.parse(varargin{:});
roi          = parser.Results.roi;


b            = pinv(X)*Y;                    %parameters
eij          = Y - X*b;                      %residuals
R            = eij'*eij;                     %residuals sum of squares
df           = size(Y,1) - rank(X);          %degrees of freedom
sigma2       = diag(R)/df;                   %variance
t            = (c'*b)'  ./  (sqrt(sigma2*(c'*(inv(X'*X))*c))  + eps);


% create SPM object:
if numel(t)==1
    SPM      = spm1d.stats.spm.SPM0D('T', t', [1 df], eij, 'beta',b, 'sigma2',sigma2);
else
    fwhm     = mean( spm1d.geom.fwhm(eij) );
    if isempty(roi)
        resels   = spm1d.geom.resels(eij, fwhm);
    else
        B    = any(isnan(eij), 1);
        B    = ~B & roi;
        resels   = spm1d.geom.resels(B, fwhm);
    end
    SPM      = spm1d.stats.spm.SPM('T', t', [1 df], fwhm, resels, b, eij, sigma2', 'roi', roi);
end


