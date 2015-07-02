function [self] = SimulatedTwoLocalMax()
dir0      = spm1d.data.get_matfile_path();
fname     = fullfile(dir0, 'ex_sim_twolocalmax.mat');
Y         = getfield(load(fname), 'Y');
self.YA   = Y(7:12,:);
self.YB   = Y(1:6,:);
end


