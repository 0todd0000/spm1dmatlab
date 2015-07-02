function [self] = RSXLTraining()
self.www    = 'http://www.real-statistics.com/anova-repeated-measures/two-within-subjects-factors/';
self.Y      = [13,12,17,18,30,34,  12,19,18,6,18,30,  17,19,24,21,31,32,  12,25,25,18,39,40,  19,27,19,18,28,27,  6,12,6,6,18,23,  17,18,30,24,36,38,  18,29,36,22,36,40,  23,30,24,18,38,32,  18,12,24,24,25,34]';
self.A      = repmat([0,0,0,1,1,1], [1 10])';
self.B      = repmat([0,1,2,0,1,2], [1 10])';
self.SUBJ   = sort( repmat(1:10, [1 6]) )';
self.z      = [33.85228, 26.95919, 12.63227];
self.df     = {[1, 9], [2, 18], [2, 18]};
self.p      = [0.000254, 3.85e-6, 0.000373];
end