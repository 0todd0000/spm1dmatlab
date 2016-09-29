function [ci] = ci_onesample(y, alpha, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



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