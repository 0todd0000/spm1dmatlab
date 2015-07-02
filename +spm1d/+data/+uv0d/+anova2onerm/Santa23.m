function [self] = Santa23()
self.design = 'Two-way repeated-measures ANOVA (with interaction) (one within-subject factor)';
self.www    = 'http://www.statisticshell.com/docs/mixed.pdf';
self.Y      = [1,3,1, 2,5,3, 4,6,6, 5,7,4, 5,9,1, 6,9,3,     1,10,2, 4,8,1, 5,7,3, 4,9,2, 2,10,4, 5,10,2]';
self.A      = [zeros(1,18) ones(1,18)]';
self.B      = repmat(0:2, [1 12])';
subj        = sort(repmat(1:6, [1 3]));
self.SUBJ   = [subj 10+subj]';
self.z      = [0.511, 36.946, 3.856];
self.df     = {[1,10], [2,20], [2, 20]};
self.p      = [0.491, 0.000, 0.038];
end