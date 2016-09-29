function [ci] = ci_twosample(yA, yB, alpha, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



%parse varargin
results   = spm1d.stats.ci.parse_args('twosample', varargin{:});
datum     = results.datum;
criterion = results.criterion;
mu        = results.mu;


%construct CI:
spmi      = spm1d.stats.ttest2(yA - mu, yB).inference(alpha, 'two_tailed',true);
[mA,mB]   = deal( mean(yA, 1), mean(yB, 1) );     %sample means
s         = spmi.sigma2 .^ 0.5;     %sample standard deviation (pooled)
[JA,JB]   = deal( size(yA,1), size(yB,1) );
hstar     = spmi.zstar * s * (1/JA + 1/JB)^0.5;

if isequal(datum, 'difference')
    if spmi.dim==0
        ci = spm1d.stats.ci.CITwoSampleDifference0D(spmi, mA-mB, hstar, mu);
    else
        ci = spm1d.stats.ci.CITwoSampleDifference1D(spmi, mA-mB, hstar, mu);
    end
else
    if spmi.dim==0
        ci = spm1d.stats.ci.CITwoSample0D(spmi, mA, mB, hstar, criterion);
    else
        ci = spm1d.stats.ci.CITwoSample1D(spmi, mA, mB, hstar, criterion);
    end
end

