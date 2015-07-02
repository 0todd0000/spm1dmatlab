function [self] = Besier2009kneeflexion()
self.cite = 'Besier, T. F., Fredericson, M., Gold, G. E., Beaupr?, G. S., & Delp, S. L. (2009). Knee muscle forces during walking and running in patellofemoral pain patients and pain-free controls. Journal of Biomechanics, 42(7), 898?905. http://doi.org/10.1016/j.jbiomech.2009.01.032';
self.www  = 'https://simtk.org/home/muscleforces';
self.note = 'Results  appear in:  Pataky, T. C., Vanrenterghem, J., & Robinson, M. A. (2015). Two-way ANOVA for scalar trajectories, with experimental evidence of non-phasic interactions. Journal of Biomechanics, 48(1), 186?189. http://doi.org/10.1016/j.jbiomech.2014.10.013';
dir0      = spm1d.data.get_matfile_path();
fname     = fullfile(dir0, 'Besier2009kneeflexion.mat');
s         = load(fname);
self.Y    = s.Y;
self.A    = s.GROUP';
self.B    = s.GENDER';
end


