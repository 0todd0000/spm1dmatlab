    

clear;  clc


%(0) Load data:
dataset    = spm1d.data.uv1d.anova1rm.SpeedGRFcategoricalRM();
[y,A,SUBJ] = deal(dataset.Y, dataset.A, dataset.SUBJ);



%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
iterations = 100;
snpm       = spm1d.stats.nonparam.anova1rm(y, A, SUBJ);
snpmi      = snpm.inference(alpha, 'iterations', iterations);
disp('Non-Parametric results')
disp( snpmi )



%(2) Compare to parametric inference:
spm        = spm1d.stats.anova1rm(y, A, SUBJ);
spmi       = spm.inference(alpha);
disp('Parametric results')
disp( spmi )
% plot:
close all
figure('position', [0 0 1000 300])
subplot(121);  spmi.plot();  spmi.plot_threshold_label();  spmi.plot_p_values();  title('Parametric')
subplot(122);  snpmi.plot(); snpmi.plot_threshold_label(); snpmi.plot_p_values();  title('Non-parametric')
















