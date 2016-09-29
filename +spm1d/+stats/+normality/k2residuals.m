function [SPM] = k2residuals(x)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky





J   = size(x, 1);
if J < 8
    error( 'In order to conduct a normality test there must at least 8 observations. Only %d found.', J );
end

df   = [1 2];
dim  = size(x, 2) - 1;

if dim==0
    k2        = spm1d.stats.normality.k2_single_node(x);
    SPM       = spm1d.stats.spm.SPM0D('X2', k2, df, x);
else
    Q         = size(x,2);
    k2        = zeros(1, Q);
    for i = 1:Q
        k2(i) = spm1d.stats.normality.k2_single_node( x(:,i) );
    end
    fwhm      = mean( spm1d.geom.fwhm(x) );
    resels    = spm1d.geom.resels(x, fwhm);
    sigma2    = std(x, 1).^2;
    SPM       = spm1d.stats.spm.SPM('X2', k2, df, fwhm, resels, zeros(1,Q), x, sigma2);
end


