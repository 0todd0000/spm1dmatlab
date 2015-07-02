function [self] = RSWeightClinic()
self.www  = 'http://www.real-statistics.com/students-t-distribution/paired-sample-t-test/';
self.YA   = [210,205,193,182,259,239,164,197,222,211,187,175,186,243,246]';
self.YB   = [197,195,191,174,236,226,157,196,201,196,181,164,181,229,231]';
self.z    = 6.6896995;
self.df   = [1,14];
self.p    = 0.5*1.028e-5;  %one-tailed
end


