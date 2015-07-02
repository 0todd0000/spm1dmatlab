function [self] = Dorn2012()
self.cite = 'Dorn, T. W., Schache, A. G., & Pandy, M. G. (2012). Muscular strategy shift in human running: dependence of running speed on hip and ankle muscle performance. Journal of Experimental Biology, 215(11), 1944?1956. http://doi.org/10.1242/jeb.064527';
self.www  = 'https://simtk.org/home/runningspeeds';
dir0      = spm1d.data.get_matfile_path();
fname     = fullfile(dir0, 'Dorn2012.mat');
s         = load(fname);
FOOT      = s.FOOT';
self.Y    = s.Y(FOOT==0,:,:);
self.x    = s.SPEED(FOOT==0)';
end


