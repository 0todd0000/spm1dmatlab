function [self] = KendallRandomNumbers()
self.www  = 'http://www.statext.com/practice/NormalityTest04.php';
self.Y    = [303, 338, 406, 457, 461, 469, 474, 489, 515, 583]';
self.z    = 0.66;
self.df   = [1 2];
self.p    = 0.7195;
self.note = 'Original data are from p.194 of:  Kendall M (1948) Rank Correlation Methods, Charles Griffin & Company Ltd.';
end

