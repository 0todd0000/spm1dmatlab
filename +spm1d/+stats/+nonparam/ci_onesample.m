function [ci] = ci_onesample(y, alpha, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



%parse varargin
results     = spm1d.stats.nonparam.ci.parse_args('onesample', varargin{:});
mu          = results.mu;
iterations  = results.iterations;

snpm        = spm1d.stats.nonparam.ttest(y, mu);
snpmi       = snpm.inference(alpha, 'two_tailed',true, 'iterations', iterations);
snpmi.zstar = max(snpmi.zstar);


[mn,s]      = deal( mean(y, 1), std(y,0,1) );   %sample mean and SD
hstar       = snpmi.zstar .* s / size(y,1)^0.5;   %CI height

if snpmi.dim==0
    ci = spm1d.stats.nonparam.ci.CIOneSample0DNP(snpmi, mn, hstar, mu);
else
    ci = spm1d.stats.nonparam.ci.CIOneSample1DNP(snpmi, mn, hstar, mu);
end