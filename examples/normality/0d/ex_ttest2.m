

clear;  clc


%(0) Create data:
%%% Dataset 1  (non-normally distributed)
yA1   = [5.7, 8.4, 6.0, 6.4, 5.5]';
yB1   = [5.3, 8.2, 5.5, 6.1, 5.6]';
%%% Dataset2 (more normally distributed)
yA2   = [ 1.764,  0.400,  0.978,  2.240,  1.867]';
yB2   = [ 0.950, -0.151, -0.103,  0.410,  0.144]';


%(1) Conduct normality tests:
alpha  = 0.05;
spmi1  = spm1d.stats.normality.ttest2(yA1, yB1).inference(alpha);
spmi2  = spm1d.stats.normality.ttest2(yA2, yB2).inference(alpha);
disp('Non-normally distributed data:')
disp( spmi1 )
disp('Normally distributed data:')
disp( spmi2 )


















