function [self] = Neptune1999kneekin()
self.cite     = 'Neptune, R. R., Wright, I. C., & van den Bogert, A. J. (1999). Muscle coordination and function during cutting movements. Medicine & Science in Sports & Exercise, 31(2), 294?302.';
self.www      = 'http://isbweb.org/data/rrn/index.html';
self.note     = 'Results in: Pataky, T., Robinson, M., & Vanrenterghem, J. (2015). Journal of Biomechanics. Journal of Biomechanics, 48(1), 190?192. http://doi.org/10.1016/j.jbiomech.2014.09.025';
dir0      = spm1d.data.get_matfile_path();
fname     = fullfile(dir0, 'Neptune1999kneekin.mat');
s         = load(fname);
self.YA   = s.YA;
self.YB   = s.YB;
end


