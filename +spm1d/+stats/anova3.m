function [SPM] = anova3(Y, A, B, C, varargin)
% Three-way ANOVA (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.anova3(y, A, B, C)
% [spm] = spm1d.stats.anova3(y, A, B, C, roi)
% [spm] = spm1d.stats.anova3(y, A, B, C, 'roi', roi)
%
% y     - (J x Q) data array
%         J - total number of responses
%         Q - number of continuum nodes
% A     - (J x 1) array of group labels for Factor A {integers}
% B     - (J x 1) array of group labels for Factor B {integers}
% C     - (J x 1) array of group labels for Factor C {integers}
% roi   - (1 x Q) region of interest {1D data only}
%
% spm   - statistical parametric map object
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky


design = spm1d.stats.anova.designs.ANOVA3(A, B, C);
model  = spm1d.stats.anova.LinearModel(Y, design.X, varargin{:});
model  = model.fit();
SPM    = model.aov(design.contrasts, design.f_terms);
SPM    = spm1d.stats.spm.SPMFList(SPM);
SPM    = spm1d.stats.anova.set_labels(SPM, design);



