function [self] = MinnesotaGeyerRate()
self.www      = 'http://www.stat.umn.edu/geyer/3011/examp/conf.html';
self.datafile = 'http://www.stat.umn.edu/geyer/3011/mdata/chap16/eg16-01.dat';
self.Y        = [29, 27, 34, 40, 22, 28, 14, 35, 26, 35, 12, 30, 23, 18, 11, 22, 23, 33]';
self.alpha    = 0.05;
self.ci       = [21.52709, 29.80625];
self.note     = 'From "Example 16.1" at the link above.';
end



