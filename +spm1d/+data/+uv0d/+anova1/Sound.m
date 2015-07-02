function [self] = Sound()
self.www     = 'http://web.mst.edu/~psyworld/anovaexample.htm';
Y  = [
[7, 4, 6, 8, 6, 6, 2, 9]
[5, 5, 3, 4, 4, 7, 2, 2]
[2, 4, 7, 1, 2, 1, 5, 5]
]';
self.Y     = Y(:);
self.A     = [0*ones(1,8) 1*ones(1,8) 2*ones(1,8)]';
self.z     = 3.59;
self.df    = [2, 21];
self.p     = 0.0456;    %calculated as:  scipy.stats.f.sf(3.59, 2, 21)
end