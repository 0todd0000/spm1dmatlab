function [self] = SPM1D_ANOVA2RM_4x4()
dir0      = spm1d.data.get_matfile_path();
fname     = fullfile(dir0, 'spm1d_anova2rm_4x4.mat');
s         = load(fname);
self.Y    = s.Y;
self.A    = s.A;
self.B    = s.B;
self.SUBJ = s.SUBJ;
end


