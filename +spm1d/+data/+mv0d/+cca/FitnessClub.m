function [self] = FitnessClub()

%NOTE:  This analysis is not yet implemented in spm1d!!!!
%Both independent and dependent variables are multivariate.
%spm1_stats_cca  currently accepts only one univariate independent variable.

self.www  = 'http://support.sas.com/documentation/cdl/en/statug/63033/HTML/default/viewer.htm#statug_cancorr_sect020.htm';

A = [
[191,  36,  50,   5,  162,   60],
[189,  37,  52,   2,  110,   60],
[193,  38,  58,  12,  101,  101],
[162,  35,  62,  12,  105,   37],
[189,  35,  46,  13,  155,   58],
[182,  36,  56,   4,  101,   42],
[211,  38,  56,   8,  101,   38],
[167,  34,  60,   6,  125,   40],
[176,  31,  74,  15,  200,   40],
[154,  33,  56,  17,  251,  250],
[169,  34,  50,  17,  120,   38],
[166,  33,  52,  13,  210,  115],
[154,  34,  64,  14,  215,  105],
[247,  46,  50,   1,   50,   50],
[193,  36,  46,   6,   70,   31],
[202,  37,  62,  12,  210,  120],
[176,  37,  54,   4,   60,   25],
[157,  32,  52,  11,  230,   80],
[156,  33,  54,  15,  225,   73],
[138,  33,  68,   2,  110,   43]
]; %#ok<*COMNL>

self.x    = A(:,1);   %only use the first independent variable
self.Y    = A(:,4:end);  %dependent variable (3-component vector)

self.z    = 5.1458;   %computed using MATLAB's canoncorr
self.df   = [1, 3];
self.p    = 0.1614;   %computed using MATLAB's canoncorr

end
