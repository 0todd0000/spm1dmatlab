function [self] = SpeedGRFcategorical(varargin)
self.cite = 'Pataky, T. C., Caravaggi, P., Savage, R., Parker, D., Goulermas, J., Sellers, W., & Crompton, R. (2008). New insights into the plantar pressure correlates of walking speed using pedobarographic statistical parametric mapping (pSPM). Journal of Biomechanics, 41(9), 1987?1994.';
if nargin>0
    subj  = varargin{1};
else
    subj  = 0;
end
dir0      = spm1d.data.get_matfile_path();
fnameY    = fullfile(dir0, sprintf('ex_grf_subj%03d.mat',subj) );
fnameX    = fullfile(dir0, 'ex_grf_speeds_cond.mat');
self.Y    = getfield(load(fnameY), 'Y');
X         = getfield(load(fnameX), 'x');
self.A    = X(:,subj+1);
end


