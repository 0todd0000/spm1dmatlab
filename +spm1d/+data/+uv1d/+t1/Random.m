function [self] = Random()
dir0      = spm1d.data.get_matfile_path();
fname     = fullfile(dir0, 'random.mat');
self.Y    = getfield(load(fname), 'Y');
self.mu   = 0;
end


