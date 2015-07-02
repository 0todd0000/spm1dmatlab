function [self] = Pataky2014cop()
self.cite = 'Pataky, T. C., Robinson, M. A., Vanrenterghem, J., Savage, R., Bates, K. T., & Crompton, R. H. (2014). Vector field statistics for objective center-of-pressure trajectory analysis during gait, with evidence of scalar sensitivity to small coordinate system rotations. Gait and Posture, 1?4. http://doi.org/10.1016/j.gaitpost.2014.01.023';
dir0      = spm1d.data.get_matfile_path();
fname     = fullfile(dir0, 'Pataky2014cop.mat');
s         = load(fname);
self.YA   = s.YA;
self.YB   = s.YB;
end


