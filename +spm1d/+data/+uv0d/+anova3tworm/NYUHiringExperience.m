function [self] = NYUHiringExperience()
self.www   = 'http://www.psych.nyu.edu/cohen/three_way_ANOVA.pdf';
% data: Table 22.4  (page 715);
% results:  Table 22.5  (page 721);
% repeated-measures factors:  B, C;
Y     = [
5.2, 5.8, 5.6, 4.4,...   %low,below,female;
5.2, 6.0, 5.6, 5.8,...   %low,below,male;
5.8, 6.4, 6.0, 7.0,...   %low,average,female;
6.0, 5.2, 6.2, 6.8,...   %low,average,male;
7.4, 7.6, 6.6, 7.8,...   %low,above,female;
7.6, 8.0, 7.8, 6.4,...   %low,above,male;
4.8, 5.4, 4.2, 4.6,...   %moderate,below,female;
5.4, 4.8 ,5.2 ,6.0,...   %moderate,below,male;
5.6 ,5.4, 5.0, 6.2,...   %moderate,average,female;
6.0, 6.6, 5.8, 5.4,...   %moderate,average,male;
6.4, 5.8, 7.6, 7.2,...   %moderate,above,female;
7.0, 7.6, 6.8, 6.4,...   %moderate,above,male;
4.4, 5.2, 3.6, 4.0,...   %high,below,female;
5.8, 6.6, 6.4, 5.0,...   %high,below,male;
6.0, 5.6, 6.2, 5.2,...   %high,average,female;
7.0, 6.2, 7.8, 6.8,...   %high,average,male;
7.0, 6.6, 5.2, 6.8,...   %high,above,female;
5.6, 4.8, 6.4, 5.8,...   %high,above,male;
];
self.Y     = Y';
self.A     = [0*ones(1, 4*2*3)   1*ones(1, 4*2*3)     2*ones(1, 4*2*3)]';   %Experience (Low, Moderate, High)
self.B     = repmat([0*ones(1, 4*2)   1*ones(1, 4*2)     2*ones(1, 4*2)],  [1 3])';   %Attractiveness (Below, Average, Above)
self.C     = repmat([0*ones(1, 4)   1*ones(1, 4)],  [1 3*3])';   %Gender (Female, Male)
subj       = repmat(1:4, [1 2*3]);
self.SUBJ  = [subj subj+10 subj+20]';
self.z     = [18.4,35.81,6.48, 3.92,1.35,3.69, 2.23];
self.df    = {[2,9],[2,18],[1,9],  [4,18],[2,9],[2,18],  [4,18]};
self.p     = {'<0.001', '<0.001', '<0.05',    '<0.05', '>0.05', '<0.05',  '>0.05'};
end