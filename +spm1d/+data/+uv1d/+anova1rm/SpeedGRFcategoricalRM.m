function [self] = SpeedGRFcategoricalRM()
self.cite = 'Pataky, T. C., Caravaggi, P., Savage, R., Parker, D., Goulermas, J., Sellers, W., & Crompton, R. (2008). New insights into the plantar pressure correlates of walking speed using pedobarographic statistical parametric mapping (pSPM). Journal of Biomechanics, 41(9), 1987?1994.';
dir0      = spm1d.data.get_matfile_path();
fname     = fullfile(dir0, 'ex_grf_means.mat');
s         = load(fname);
self.Y    = s.Y;
self.A    = s.SPEED';
self.SUBJ = s.SUBJ';
end


