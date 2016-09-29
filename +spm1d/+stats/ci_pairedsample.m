function [ci] = ci_pairedsample(yA, yB, alpha, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



%parse varargin
results   = spm1d.stats.ci.parse_args('pairedsample', varargin{:});
datum     = results.datum;
criterion = results.criterion;
mu        = results.mu;


%construct CI:
spmi    = spm1d.stats.ttest(yA - yB, mu).inference(alpha, 'two_tailed',true);
[mA,mB] = deal( mean(yA, 1), mean(yB, 1) );     %sample means
s       = spmi.sigma2 .^ 0.5;     %sample standard deviation
hstar   = spmi.zstar * s / size(yA,1)^0.5;

if isequal(datum, 'difference')
    if spmi.dim==0
        ci = spm1d.stats.ci.CIPairedDifference0D(spmi, mA-mB, hstar, mu);
    else
        ci = spm1d.stats.ci.CIPairedDifference1D(spmi, mA-mB, hstar, mu);
    end
else
    if spmi.dim==0
        ci = spm1d.stats.ci.CIPairedSample0D(spmi, mA, mB, hstar, criterion);
    else
        ci = spm1d.stats.ci.CIPairedSample1D(spmi, mA, mB, hstar, criterion);
    end
end


