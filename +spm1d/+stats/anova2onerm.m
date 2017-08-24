function [SPM] = anova2onerm(Y, A, B, SUBJ, varargin)
% Two-way ANOVA with one repeated-measures factor
% (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.anova2onerm(y, A, B, SUBJ)
% [spm] = spm1d.stats.anova2onerm(y, A, B, SUBJ, roi)
% [spm] = spm1d.stats.anova2onerm(y, A, B, SUBJ, 'roi', roi)
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
%
% NOTE:
% - Factor B is the repeated-measures factor (i.e. repeated measurements
% are made over the different levels of Factor B, and not over the
% different levels of Factor A)
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky


parser         = spm1d.stats.anova.parseargs(varargin{:});
force_approx0D = parser.Results.force_approx0D;

design = spm1d.stats.anova.designs.ANOVA2onerm(A, B, SUBJ);
model  = spm1d.stats.anova.LinearModel(Y, design.X, varargin{:});
if (model.dim==1 || force_approx0D) && ( design.check_for_single_responses(model.dim) )
    model  = model.fit(  design.contrasts.C(1:5,:)  );
else
    model  = model.fit();
end
SPM    = model.aov(design.contrasts, design.f_terms);
SPM    = spm1d.stats.spm.SPMFList(SPM);
SPM    = spm1d.stats.anova.set_labels(SPM, design);


