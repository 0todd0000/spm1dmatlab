function [ci] = ci_twosample(yA, yB, alpha, varargin)
%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky

roi_found = any(   cellfun(@(c)(isequal(lower(c),'roi')), varargin(1:end:2))   );
if roi_found
    error('[spm1d error]  "roi" analysis is not supported for nonparametric procedures.')
end


spm1d.util.check_zero_var(yA);
spm1d.util.check_zero_var(yB);

%parse varargin
results     = spm1d.stats.nonparam_old.ci.parse_args('pairedsample', varargin{:});
datum       = results.datum;
criterion   = results.criterion;
mu          = results.mu;
iterations  = results.iterations;


%construct CI:
spm         = spm1d.stats.ttest2(yA - mu, yB);
snpmi       = spm1d.stats.nonparam_old.ttest2(yA - mu, yB).inference(alpha, 'two_tailed',true, 'iterations', iterations);
snpmi.zstar = max( snpmi.zstar );
[mA,mB]     = deal( mean(yA, 1), mean(yB, 1) );     %sample means
s           = spm.sigma2 .^ 0.5;     %sample standard deviation (pooled)
[JA,JB]     = deal( size(yA,1), size(yB,1) );
hstar       = snpmi.zstar * s * (1/JA + 1/JB)^0.5;



if isequal(datum, 'difference')
    if snpmi.dim==0
        ci = spm1d.stats.nonparam_old.ci.CITwoSampleDifference0DNP(snpmi, mA-mB, hstar, mu);
    else
        ci = spm1d.stats.nonparam_old.ci.CITwoSampleDifference1DNP(snpmi, mA-mB, hstar, mu);
    end
else
    if snpmi.dim==0
        ci = spm1d.stats.nonparam_old.ci.CITwoSample0DNP(snpmi, mA, mB, hstar, criterion);
    else
        ci = spm1d.stats.nonparam_old.ci.CITwoSample1DNP(snpmi, mA, mB, hstar, criterion);
    end
end

