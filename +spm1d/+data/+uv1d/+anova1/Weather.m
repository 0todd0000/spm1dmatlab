function [self] = Weather()
self.cite = 'Ramsay JO, Silverman BW (2005). Functional Data Analysis (Second Edition), Springer, New York.';
self.www  = 'http://www.psych.mcgill.ca/misc/fda/ex-weather-a1.html';
dir0      = spm1d.data.get_matfile_path();
fname     = fullfile(dir0, 'weather.mat');
s         = load(fname);
self.Y    = [s.y0;  s.y1;  s.y2;  s.y3];
self.A    = [0*ones(1,size(s.y0,1))  1*ones(1,size(s.y1,1))  2*ones(1,size(s.y2,1))  3*ones(1,size(s.y3,1))]';
end


