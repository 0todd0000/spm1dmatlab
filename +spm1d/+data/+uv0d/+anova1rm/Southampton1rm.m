function [self] = Southampton1rm()
self.www   = 'http://www.southampton.ac.uk/~cpd/anovas/datasets/Doncaster&Davey%20-%20Model%206_1%20One%20factor%20repeated%20measures.txt';
self.Y     = [-4.4297, 4.7513, 3.2971, -1.4606, 4.8458, 5.1163, 6.0739, -1.9225, 6.1542, 10.4794, 12.4438, 9.2150]';
self.A     = [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3]';
self.SUBJ  = [1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4]';
self.z     = 12.36;
self.df    = [2, 6];
self.p     = 0.007;
end