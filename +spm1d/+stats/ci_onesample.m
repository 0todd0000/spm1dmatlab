function [ci] = ci_onesample(y, alpha, varargin)
% Confidence interval for a one-sample design
% 
% FORMATS
% [ci] = spm1d.stats.ci_onesample(y, alpha)
% [ci] = spm1d.stats.ci_onesample(y, alpha, mu)
% [ci] = spm1d.stats.ci_onesample(y, alpha, 'mu', mu)
%
% y     - (J x Q) data array
%         J - number of responses
%         Q - number of continuum nodes
% alpha - Type I error rate {use 0.05 for a 95% CI}
% mu    - (1 x Q) datum {default: zeros(1,Q)}
%
% ci    - confidence interval object
%
% NOTE:  CI results are equivalent to two-tailed t test results, but
% interpreting CI results can be difficult because the datum and/or
% thresholds are often ambiguous. See the paper below for more details.
%
% Pataky, T. C., Vanrenterghem, J., & Robinson, M. A. (2015). Zero- vs.
% one-dimensional, parametric vs. non-parametric, and confidence interval
% vs. hypothesis testing procedures in one-dimensional biomechanical
% trajectory analysis. Journal of Biomechanics, 48(7), 1277?1285.
% http://doi.org/10.1016/j.jbiomech.2015.02.051
%
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky



%parse varargin
results = spm1d.stats.ci.parse_args('onesample', varargin{:});
mu      = results.mu;



%construct CI
spmi   = spm1d.stats.ttest(y, mu).inference(alpha, 'two_tailed',true);
mn     = spmi.beta + mu;       %sample mean
s      = spmi.sigma2 .^ 0.5;   %sample standard deviation
hstar  = spmi.zstar .* s / size(y,1)^0.5;   %CI height
if spmi.dim==0
    ci = spm1d.stats.ci.CIOneSample0D(spmi, mn, hstar, mu);
else
    ci = spm1d.stats.ci.CIOneSample1D(spmi, mn, hstar, mu);
end