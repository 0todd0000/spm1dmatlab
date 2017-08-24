function [SPM] = ttest_paired(yA, yB, varargin)
% Paired t test (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.ttest_paired(yA, yB)
% [spm] = spm1d.stats.ttest_paired(yA, yB, mu)
% [spm] = spm1d.stats.ttest_paired(yA, yB, 'mu', mu)
% [spm] = spm1d.stats.ttest_paired(yA, yB, 'mu', mu, 'roi', roi)
%
% yA    - (J x Q) data array
%         J - number of responses
%         Q - number of continuum nodes
% yB    - (J x Q) data array
% mu    - (1 x Q) datum {default: zeros(1,Q)}
% roi   - (1 x Q) region of interest {1D data only}
%
% spm   - statistical parametric map object
%
% NOTES
% - A paired t test is equivalent to a one-sample t test on the paired
% differences, so the following two commands are equivalent:
%    [spm] = spm1d.stats.ttest_paired(yA, yB)
%    [spm] = spm1d.stats.ttest( yA - yB )
%
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky



[yA,yB] = deal(spm1d.util.flatten(yA), spm1d.util.flatten(yB));
SPM = spm1d.stats.ttest(yA-yB, varargin{:});
