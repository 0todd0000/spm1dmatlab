function [self] = ConstructionUnequalSampleSizes()
self.www     = 'http://stackoverflow.com/questions/8320603/how-to-do-one-way-anova-in-r-with-unequal-sample-sizes';
Y  = {
[34,25,27,31,26,34,21]
[33,35,31,31,42,33]
[17,30,30,26,32,28,26,29]
[28,33,31,27,32,33,40]
};
self.Y     = cell2mat(Y')';
self.A     = -1 + [1*ones(1,numel(Y{1}))   2*ones(1, numel(Y{2}))  3*ones(1, numel(Y{3}))   4*ones(1, numel(Y{4}))]';
self.z     = 3.4971;
self.df    = [3, 24];
self.p     = 0.03098;
end