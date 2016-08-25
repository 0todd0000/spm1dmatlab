function [SPM] = ttest2(yA, yB)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ttest.m 1 2016-01-04 16:07 todd $

[yA,yB]  = deal(spm1d.util.flatten(yA), spm1d.util.flatten(yB));
[mA,mB]  = deal( mean(yA, 1),  mean(yB, 1) );
[rA,rB]  = deal( yA-ones(size(yA))*diag(mA), yB-ones(size(yB))*diag(mB) );
r        = [rA; rB];
SPM      = spm1d.stats.normality.k2residuals(r);
