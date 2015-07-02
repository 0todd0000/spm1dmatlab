function [self] = RSXLDrug()
self.design = 'Two-way repeated-measures ANOVA (with interaction) (one within-subject RM factor)';
self.www    = 'http://www.real-statistics.com/anova-repeated-measures/one-between-subjects-factor-and-one-within-subjects-factor/';
y0          = [250,278,442,368,456,  65,207,341,382,298,  251,261,384,421,342,  241,314,423,415,468,  154,167,257,275,332,  103,286,401,291,367,  230,306,432,386,423];
y1          = [ 54,172,307,261,360,  20,116,425,398,268,   41,168,378,317,470,  200,157,283,259,273,   34, 86,351,280,320,   29, 81,193,240,233,    3, 54,285,216,245];
y2          = [118,124,365,311,331,  83,266,382,369,295,   38,207,289,385,373,   71,211,356,380,305,  123,331,407,461,445,   71,285,471,407,433,  108,247,317,307,324];
self.Y      = [y0 y1 y2]';
self.A      = [0*ones(1,35)   1*ones(1,35)    2*ones(1,35)]'; 
self.B      = repmat(1:5, [1 21])';
subj        = sort( repmat(1:7, [1 5]) );
self.SUBJ   = [subj 10+subj 20+subj]';
self.z      = [8.301316, 114.6323, 2.164584];
self.df     = {[2, 18], [4,72], [8,72]};
self.p      = [0.002789, 1.91e-30, 0.040346];
end