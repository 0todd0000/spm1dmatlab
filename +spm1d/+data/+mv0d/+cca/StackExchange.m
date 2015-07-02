function [self] = StackExchange()

%NOTE:  This analysis is not yet implemented in spm1d!!!!
%Both independent and dependent variables are multivariate.
%spm1_stats_cca  currently accepts only one univariate independent variable.
self.www  = 'http://stats.stackexchange.com/questions/117489/how-can-i-run-an-analysis-of-variance-with-one-independent-variable-and-multiple';
A = [
    [4.19, 5.51, 19.76, 50.00, 19.36, 54.07],
    [8.60, 10.16, 33.01, 82.99, 38.48, 44.95],
    [8.03, 7.82, 31.29, 79.05, 40.12, 59.18],
    [6.64, 8.99, 27.13, 69.13, 30.44, 59.02],
    [7.03, 8.22, 25.29, 74.45, 36.02, 50.88],
    [1.50, 5.90, 10.69, 22.88, 10.34, 34.50],
    [4.36, 7.61, 19.27, 44.47, 20.06, 24.62],
    [7.17, 8.30, 26.72, 68.68, 31.61, 20.16],
    [2.68, 5.61, 14.25, 37.07, 15.20, 67.75],
    [7.91, 7.75, 30.93, 82.01, 38.62, 65.36],
    [3.74, 5.24, 16.42, 40.17, 17.54, 15.19]
];
self.x    = A(:,1);
self.Y    = A(:,2:end);
self.z    = 47.1219;     %computed using MATLAB's canoncorr
self.df   = [1, 5];
self.p    = 5.3655e-09;  %computed using MATLAB's canoncorr


end


