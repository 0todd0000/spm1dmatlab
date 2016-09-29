    

clear;  clc


%(0) Load data:
dataset  = spm1d.data.uv1d.anova1.Weather();
[Y,A]    = deal(dataset.Y, dataset.A);
[yA,yB]  = deal( Y(A==0,:), Y(A==2,:) );



%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
two_tailed = false;
circular   = true;
iterations = 1000;
snpm       = spm1d.stats.nonparam.ttest2(yA, yB);
snpmi      = snpm.inference(alpha, 'two_tailed', two_tailed, 'iterations', iterations, 'circular',circular);
disp(snpmi)



%(2) Plot:
close all
snpmi.plot();
snpmi.plot_threshold_label();
snpmi.plot_p_values();















