function [self] = Stevens2002()
self.www  = 'http://faculty.smu.edu/kyler/courses/7314/MANOVA.pdf';
self.Y    = [[2,3];[3,4];[5,4];[2,5];    [4,8];[5,6];[6,7];    [7,6];[8,7];[10,8];[9,5];[7,6]];
self.A    = [0 0 0 0    1 1 1    2 2 2 2 2]';
self.z    = 20.4987;
self.p    = 0.0004271;
self.z    = 20.4983;    %computed in MATLAB using manova1
self.df   = [1, 4];
self.p    = 0.00039807; %computed in MATLAB using manova1
end


