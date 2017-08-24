function [SPM] = anova2(Y, A, B, varargin)
% Two-way ANOVA (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.anova2(y, A, B)
% [spm] = spm1d.stats.anova2(y, A, B, roi)
% [spm] = spm1d.stats.anova2(y, A, B, 'roi', roi)
%
% y     - (J x Q) data array
%         J - total number of responses
%         Q - number of continuum nodes
% A     - (J x 1) array of group labels for Factor A {integers}
% B     - (J x 1) array of group labels for Factor B {integers}
% roi   - (1 x Q) region of interest {1D data only}
%
% spm   - statistical parametric map object
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky


design = spm1d.stats.anova.designs.ANOVA2(A, B);
model  = spm1d.stats.anova.LinearModel(Y, design.X, varargin{:});
model  = model.fit();
SPM    = model.aov(design.contrasts, design.f_terms);
SPM    = spm1d.stats.spm.SPMFList(SPM);
SPM    = spm1d.stats.anova.set_labels(SPM, design);





