    

clear;  clc


%(0) Load data:
dataset    = spm1d.data.uv1d.anova1.SpeedGRFcategorical();
[Y,A]      = deal(dataset.Y, dataset.A);
%%% separate into groups:
Y1         = Y(A==1,:);
Y2         = Y(A==2,:);
Y3         = Y(A==3,:);



%(1) Conduct SPM analysis:
t21        = spm1d.stats.ttest2(Y2, Y1);
t32        = spm1d.stats.ttest2(Y3, Y2);
t31        = spm1d.stats.ttest2(Y3, Y1);
% inference:
alpha      = 0.05;
nTests     = 3;
p_critical = spm1d.util.p_critical_bonf(alpha, nTests);
t21i       = t21.inference(p_critical, 'two_tailed',true);
t32i       = t32.inference(p_critical, 'two_tailed',true);
t31i       = t31.inference(p_critical, 'two_tailed',true);



%(2) Plot:
close all
subplot(221);  t21i.plot();  ylim([-40 40]);  title('Normal - Slow')
subplot(222);  t32i.plot();  ylim([-40 40]);  title('Fast - Normal')
subplot(223);  t31i.plot();  ylim([-40 40]);  title('Fast - Slow')


