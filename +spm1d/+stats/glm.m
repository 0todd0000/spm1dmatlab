function [SPM] = glm(Y, X, c, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: glm.m 1 2016-01-04 16:07 todd $

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
    SPM      = spm1d.stats.spm.SPM0D('T', t', [1 df]);
else
    fwhm     = mean( spm1d.geom.fwhm(eij) );
    if isempty(roi)
        resels   = spm1d.geom.resels(eij, fwhm);
    else
        B    = any(isnan(eij), 1);
        B    = ~B & roi;
        resels   = spm1d.geom.resels(B, fwhm);
    end
    SPM      = spm1d.stats.spm.SPM('T', t', [1 df], fwhm, resels, b, eij, sigma2, 'roi', roi);
end


