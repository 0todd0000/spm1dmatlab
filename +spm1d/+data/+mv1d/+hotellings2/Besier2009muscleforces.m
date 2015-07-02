function [self] = Besier2009muscleforces()
self.cite = 'Besier, T. F., Fredericson, M., Gold, G. E., Beaupr?, G. S., & Delp, S. L. (2009). Knee muscle forces during walking and running in patellofemoral pain patients and pain-free controls. Journal of Biomechanics, 42(7), 898?905. http://doi.org/10.1016/j.jbiomech.2009.01.032';
self.www  = 'https://simtk.org/home/muscleforces';
self.note = 'Results in:  Pataky, T., Robinson, M., & Vanrenterghem, J. (2015). Journal of Biomechanics. Journal of Biomechanics, 48(1), 190?192. http://doi.org/10.1016/j.jbiomech.2014.09.025';
dir0      = spm1d.data.get_matfile_path();
fname     = fullfile(dir0, 'Besier2009muscleforces.mat');
s         = load(fname);
self.YA   = s.YA;
self.YB   = s.YB;
end


