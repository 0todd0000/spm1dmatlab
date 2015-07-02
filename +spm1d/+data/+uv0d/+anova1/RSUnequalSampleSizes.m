function [self] = RSUnequalSampleSizes()
self.www     = 'http://www.real-statistics.com/one-way-analysis-of-variance-anova/unplanned-comparisons/anova-unequal-sample-sizes/';
Y  = {
[3, 5, 6, 1, 5, 6, 4, 3, 7, 4, 5]
[2, 4, 3, 5, 1, 5, 2, 3, 6, 2, 4, 1]
[5, 8, 6, 4, 7, 8, 5, 6, 6]
[4, 5, 3, 7, 6, 3, 2, 2, 4, 5]
};
self.Y     = cell2mat(Y')';
self.A     = -1 + [1*ones(1,numel(Y{1}))   2*ones(1, numel(Y{2}))  3*ones(1, numel(Y{3}))   4*ones(1, numel(Y{4}))]';
self.z     = 5.864845;
self.df    = [3, 38];
self.p     = 0.00215;
end