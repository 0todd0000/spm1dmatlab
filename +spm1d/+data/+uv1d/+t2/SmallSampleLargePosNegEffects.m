function [self] = SmallSampleLargePosNegEffects()
self.cite = 'https://github.com/0todd0000/spm1d/issues/307';
dir0      = spm1d.data.get_matfile_path();
fname     = fullfile(dir0, 'SmallSampleLargePosNegEffects.mat');
self.YA   = getfield(load(fname), 'y0');
self.YB   = getfield(load(fname), 'y1');
end


