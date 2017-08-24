function [SPM] = anova3tworm(Y, A, B, C, SUBJ, varargin)
% Three-way ANOVA with two repeated-measures factors
% (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.anova3tworm(y, A, B, C, SUBJ)
% [spm] = spm1d.stats.anova3tworm(y, A, B, C, SUBJ, roi)
% [spm] = spm1d.stats.anova3tworm(y, A, B, C, SUBJ, 'roi', roi)
%
% y     - (J x Q) data array
%         J - total number of responses
%         Q - number of continuum nodes
% A     - (J x 1) array of group labels for Factor A {integers}
% B     - (J x 1) array of group labels for Factor B {integers}
% C     - (J x 1) array of group labels for Factor C {integers}
% SUBJ  - (J x 1) array of subject labels {integers}
% roi   - (1 x Q) region of interest {1D data only}
%
% spm   - statistical parametric map object
%
% NOTE:
% - Factors B & C are the repeated-measures factors (i.e. repeated
% measurements are made over the different levels of Factors B & C, and not
% over the different levels of Factor A)
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky



parser         = spm1d.stats.anova.parseargs(varargin{:});
force_approx0D = parser.Results.force_approx0D;


design = spm1d.stats.anova.designs.ANOVA3tworm(A, B, C, SUBJ);
model  = spm1d.stats.anova.LinearModel(Y, design.X, varargin{:});
if (model.dim==1 || force_approx0D) && ( design.check_for_single_responses(model.dim) )
    model  = model.fit(  design.contrasts.C(1:8,:)  );
else
    model  = model.fit();
end
SPM    = model.aov(design.contrasts, design.f_terms);
SPM    = spm1d.stats.spm.SPMFList(SPM);
SPM    = spm1d.stats.anova.set_labels(SPM, design);



