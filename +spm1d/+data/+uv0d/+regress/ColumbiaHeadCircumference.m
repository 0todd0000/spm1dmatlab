function [self] = ColumbiaHeadCircumference()
self.www  = 'http://www.stat.columbia.edu/~martin/W2024/R4.pdf';
self.x    = [27.75, 24.5, 25.5, 26, 25, 27.75, 26.5, 27, 26.75, 26.75, 27.5]';
self.Y    = [17.5, 17.1, 17.1,17.3, 16.9, 17.6, 17.3, 17.5, 17.3, 17.5, 17.5]';
self.mu   = 0.3;
self.z    = 6.63;
self.df   = [1,9];
self.p    = 9.59e-5;
self.r    = 0.8301^0.5;
end