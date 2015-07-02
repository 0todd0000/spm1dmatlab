function [self] = Antidepressant()
self.www    = 'http://www.pc.rhul.ac.uk/staff/J.Larsson/teaching/pdfs/repeatedmeasures.pdf';
Y = [
[70, 60, 81, 52]
[66, 52, 70, 40]
[56, 41, 60, 31]
[68, 59, 77, 49]
];
self.Y     = Y(:);
self.SUBJ  = [1 2 3 4    1 2 3 4   1 2 3 4   1 2 3 4]';
self.A     = [0 0 0 0    0 0 0 0   1 1 1 1   1 1 1 1]';
self.B     = [0 0 0 0    1 1 1 1   0 0 0 0   1 1 1 1]';
self.z     = [1.459, 530.842, 192.667];
self.df    = {[1, 3], [1, 3], [1, 3]};
self.p     = [0.314, 0.000, 0.001];
end