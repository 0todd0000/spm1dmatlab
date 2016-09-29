function [ci] = ci_pairedsample(yA, yB, alpha, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


%parse varargin
results    = spm1d.stats.nonparam.ci.parse_args('pairedsample', varargin{:});
datum      = results.datum;
criterion  = results.criterion;
mu         = results.mu;
iterations = results.iterations;


%construct CI:
spmi       = spm1d.stats.nonparam.ttest(yA - yB, mu).inference(alpha, 'two_tailed',true, 'iterations', iterations);
spmi.zstar = max( spmi.zstar );
[mA,mB]    = deal( mean(yA, 1), mean(yB, 1) );     %sample means
s          = std(yA-yB, 0, 1);     %sample standard deviation
hstar      = spmi.zstar * s / size(yA,1)^0.5;

if isequal(datum, 'difference')
    if spmi.dim==0
        ci = spm1d.stats.nonparam.ci.CIPairedDifference0DNP(spmi, mA-mB, hstar, mu);
    else
        ci = spm1d.stats.nonparam.ci.CIPairedDifference1DNP(spmi, mA-mB, hstar, mu);
    end
else
    if spmi.dim==0
        ci = spm1d.stats.nonparam.ci.CIPairedSample0DNP(spmi, mA, mB, hstar, criterion);
    else
        ci = spm1d.stats.nonparam.ci.CIPairedSample1DNP(spmi, mA, mB, hstar, criterion);
    end
end

