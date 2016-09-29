    

clear;  clc


%(0) Load data:
dataset = spm1d.data.uv1d.t2.PlantarArchAngle();
% dataset = spm1d.data.uv1d.t2.SimulatedTwoLocalMax();
[yA,yB] = deal(dataset.YA, dataset.YB);



%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
two_tailed = false;
iterations = 1000;
snpm       = spm1d.stats.nonparam.ttest2(yA, yB);
snpmi      = snpm.inference(alpha, 'two_tailed', two_tailed, 'iterations', iterations);
disp('Non-Parametric results')
disp( snpmi )



%(2) Compare to parametric inference:
spm        = spm1d.stats.ttest2(yA, yB);
spmi       = spm.inference(alpha, 'two_tailed',two_tailed);
disp('Parametric results')
disp( spmi )
% plot:
close all
figure('position', [0 0 1000 300])
subplot(121);  spmi.plot();  spmi.plot_threshold_label();  spmi.plot_p_values();
subplot(122);  snpmi.plot(); snpmi.plot_threshold_label(); snpmi.plot_p_values();
















