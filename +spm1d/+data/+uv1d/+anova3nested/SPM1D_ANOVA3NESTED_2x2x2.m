function [self] = SPM1D_ANOVA3NESTED_2x2x2()
dir0      = spm1d.data.get_matfile_path();
fname     = fullfile(dir0, 'spm1d_anova3nested_2x2x2.mat');
s         = load(fname);
self.Y    = s.Y;
self.A    = s.A;
self.B    = s.B;
self.C    = s.C;
end


