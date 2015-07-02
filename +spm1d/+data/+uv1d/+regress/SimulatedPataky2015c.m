function [self] = SimulatedPataky2015c()
dir0      = spm1d.data.get_matfile_path();
fname     = fullfile(dir0, 'simscalar_datasetC.mat');
self.cite = 'Caravaggi, P., Pataky, T., Gunther, M., Savage, R., & Crompton, R. (2010). Dynamics of longitudinal arch support in relation to walking speed: contribution of the plantar aponeurosis. Journal of Anatomy, 217(3), 254?261. http://doi.org/10.1111/j.1469-7580.2010.01261.x';
self.Y    = getfield(load(fname), 'Y');
self.x    = (1:size(self.Y,1))';
end


