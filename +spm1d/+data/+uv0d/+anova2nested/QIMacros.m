function [self] = QIMacros()
self.www   = 'https://www.qimacros.com/hypothesis-testing/anova-two-way-nested-excel/';
self.Y     = [3,4,7.1,7.1, 6,5,8.1,8.1, 3,4,7.1,9.1, 3,3,6,8.1,    1,2,5,9.9, 2,3,6,9.9, 2,4,5,8.9, 2,3,6,10.8]';
self.A     = [0*ones(1,16)  ones(1,16)]';
self.B     = [repmat([0,1,2,3], [1 4])  repmat([4,5,6,7], [1 4])]';
self.z     = [0.111, 45.726];
self.df    = {[1, 6], [6, 24]};
self.p     = [0.742, 0.000];
end