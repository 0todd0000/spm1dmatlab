function [SPM] = ttest2(yA, yB)
% D'Agostino-Pearson K2 test on residuals from a two-sample t test
% (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.normality.ttest2(yA, yB)
%
% yA    - (JA x Q) data array
%         JA - number of Group A responses
%         Q - number of continuum nodes
% yB    - (JB x Q) data array
%         JB - number of Group B responses
%
% spm   - statistical parametric map object
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky


[yA,yB]  = deal(spm1d.util.flatten(yA), spm1d.util.flatten(yB));
[mA,mB]  = deal( mean(yA, 1),  mean(yB, 1) );
[rA,rB]  = deal( yA-ones(size(yA))*diag(mA), yB-ones(size(yB))*diag(mB) );
r        = [rA; rB];
SPM      = spm1d.stats.normality.k2residuals(r);
