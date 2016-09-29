function [ci] = ci_twosample(yA, yB, alpha, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


%parse varargin
results     = spm1d.stats.nonparam.ci.parse_args('pairedsample', varargin{:});
datum       = results.datum;
criterion   = results.criterion;
mu          = results.mu;
iterations  = results.iterations;


%construct CI:
spm         = spm1d.stats.ttest2(yA - mu, yB);
snpmi       = spm1d.stats.nonparam.ttest2(yA - mu, yB).inference(alpha, 'two_tailed',true, 'iterations', iterations);
snpmi.zstar = max( snpmi.zstar );
[mA,mB]     = deal( mean(yA, 1), mean(yB, 1) );     %sample means
s           = spm.sigma2 .^ 0.5;     %sample standard deviation (pooled)
[JA,JB]     = deal( size(yA,1), size(yB,1) );
hstar       = snpmi.zstar * s * (1/JA + 1/JB)^0.5;



if isequal(datum, 'difference')
    if snpmi.dim==0
        ci = spm1d.stats.nonparam.ci.CITwoSampleDifference0DNP(snpmi, mA-mB, hstar, mu);
    else
        ci = spm1d.stats.nonparam.ci.CITwoSampleDifference1DNP(snpmi, mA-mB, hstar, mu);
    end
else
    if snpmi.dim==0
        ci = spm1d.stats.nonparam.ci.CITwoSample0DNP(snpmi, mA, mB, hstar, criterion);
    else
        ci = spm1d.stats.nonparam.ci.CITwoSample1DNP(snpmi, mA, mB, hstar, criterion);
    end
end

