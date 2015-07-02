function [self] = Cars()
self.www     = 'http://cba.ualr.edu/smartstat/topics/anova/example.pdf';
Y  = [[643, 469, 484]; [655, 427, 456];  [702, 525, 402]];
self.Y  = Y(:);
self.A  = [0 0 0   1 1 1   2 2 2]';
self.z  = 25.17;
self.df = [2, 6];
self.p  = 0.001207;
end
