function [self] = Detergent()
self.www   = 'http://statweb.stanford.edu/~susan/courses/s141/exanova.pdf';
self.Y     = [4,5,6,5,   7,9,8,12,   10,12,11,9,    6,6,4,4,  13,15,12,12,   12,13,10,13]';
self.A     = [0,0,0,0,   0,0,0,0,    0,0,0,0,       1,1,1,1,   1,1,1,1,      1,1,1,1]';
self.B     = [0,0,0,0,   1,1,1,1,    2,2,2,2,       0,0,0,0,   1,1,1,1,    2,2,2,2]';
self.z     = [9.81008, 48.7297, 3.9730];
self.df    = {[1, 18], [2, 18], [2, 18]};
self.p     = [0.005758, 0.000, 0.037224];
end