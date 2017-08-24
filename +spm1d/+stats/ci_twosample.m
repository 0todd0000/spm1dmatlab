function [ci] = ci_twosample(yA, yB, alpha, varargin)
% Confidence interval(s) for a two-sample design
% 
% FORMATS
% [ci] = spm1d.stats.ci_twosample(yA, yB, alpha, datum, criterion)
% [ci] = spm1d.stats.ci_twosample(yA, yB, alpha, 'difference', mu)
% [ci] = spm1d.stats.ci_twosample(yA, yB, alpha, 'meanA', 'meanB')
% [ci] = spm1d.stats.ci_twosample(yA, yB, alpha, 'meanA', 'tailB')
%
% yA    - (JA x Q) data array
%         JA - number of Group A responses
%         Q - number of continuum nodes
% yB    - (JB x Q) data array
%         JB - number of Group B responses
% alpha - Type I error rate {use 0.05 for a 95% CI}
% datum - 'difference' or 'meanA' {see NOTES below}
% criterion - mu, 'meanA' or 'tailB' {see NOTES below}
% mu    - (1 x Q) datum
%
% ci    - confidence interval object
%
% NOTES:
% - The "datum" is the 0D point or 1D continuum from which the CI will be
% computed.  If "datum" is "difference" then the numerical datum is:
% [mean(yA-yB)].  If "datum" is "meanA" then the numerical datum is:
% [mean(yA)]
%
% - The "criterion" is the 0D point or 1D continuum specifying the CI
% bounds for inferring significance.
% --- If "datum" is "difference" then "criterion" is "mu"; the CI starts
% from mean(yA-yB) and results are significant if the CI fails to cross mu.
% --- If "datum" is "meanA" and "criterion" is "meanB", then the CI starts
% from mean(yA) and results are significant if the CI fails to cross
% mean(yB).
% --- If "datum" is "meanA" and "criterion" is "tailB", then the CI starts
% from mean(yA) and results are significant if the CI fails to cross
% the CI which starts at mean(yB).
%
% - CI results are equivalent to two-tailed t test results, but
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

