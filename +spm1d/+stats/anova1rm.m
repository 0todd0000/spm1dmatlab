function [SPM] = anova1rm(Y, A, SUBJ, varargin)
% One-way repeated-measures ANOVA (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.anova1rm(y, A, SUBJ)
% [spm] = spm1d.stats.anova1rm(y, A, SUBJ, roi)
% [spm] = spm1d.stats.anova1rm(y, A, SUBJ, 'roi', roi)
%
% y     - (J x Q) data array
%         J - total number of responses
%         Q - number of continuum nodes
% A     - (J x 1) array of group labels {integers}
% SUBJ  - (J x 1) array of subject labels {integers}
% roi   - (1 x Q) region of interest {1D data only}
%
% spm   - statistical parametric map object
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky



parser         = spm1d.stats.anova.parseargs(varargin{:});
force_approx0D = parser.Results.force_approx0D;


design = spm1d.stats.anova.designs.ANOVA1rm(A, SUBJ);
model  = spm1d.stats.anova.LinearModel(Y, design.X, varargin{:});
if (model.dim==1 || force_approx0D) && ( design.check_for_single_responses(model.dim) )
    model  = model.fit(  design.contrasts.C(1:3,:)  );
else
    model  = model.fit();
end
SPM    = model.aov(design.contrasts, design.f_terms);
SPM    = SPM{1};



