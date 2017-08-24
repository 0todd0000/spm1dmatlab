function [SPM] = anova1(Y, A, varargin)
% One-way ANOVA (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.anova1(y, A)
% [spm] = spm1d.stats.anova1(y, A, roi)
% [spm] = spm1d.stats.anova1(y, A, 'roi', roi)
%
% y     - (J x Q) data array
%         J - total number of responses
%         Q - number of continuum nodes
% A     - (J x 1) array of group labels {integers}
% roi   - (1 x Q) region of interest {1D data only}
%
% spm   - statistical parametric map object
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky


design = spm1d.stats.anova.designs.ANOVA1(A);
model  = spm1d.stats.anova.LinearModel(Y, design.X, varargin{:});
model  = model.fit();
SPM    = model.aov(design.contrasts, design.f_terms);
SPM    = SPM{1};



