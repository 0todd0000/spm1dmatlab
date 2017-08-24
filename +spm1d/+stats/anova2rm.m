function [SPM] = anova2rm(Y, A, B, SUBJ, varargin)
% Two-way repeated-measures ANOVA (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.anova2rm(y, A, B, SUBJ)
% [spm] = spm1d.stats.anova2rm(y, A, B, SUBJ, roi)
% [spm] = spm1d.stats.anova2rm(y, A, B, SUBJ, 'roi', roi)
%
% y     - (J x Q) data array
%         J - total number of responses
%         Q - number of continuum nodes
% A     - (J x 1) array of group labels for Factor A {integers}
% B     - (J x 1) array of group labels for Factor B {integers}
% SUBJ  - (J x 1) array of subject labels {integers}
% roi   - (1 x Q) region of interest {1D data only}
%
% spm   - statistical parametric map object
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky



parser         = spm1d.stats.anova.parseargs(varargin{:});
force_approx0D = parser.Results.force_approx0D;

design = spm1d.stats.anova.designs.ANOVA2rm(A, B, SUBJ);
model  = spm1d.stats.anova.LinearModel(Y, design.X, varargin{:});
if (model.dim==1 || force_approx0D) && ( design.check_for_single_responses(model.dim) )
    model  = model.fit(  design.contrasts.C(1:5,:)  );
else
    model  = model.fit();
end
SPM    = model.aov(design.contrasts, design.f_terms);
SPM    = spm1d.stats.spm.SPMFList(SPM);
SPM    = spm1d.stats.anova.set_labels(SPM, design);


