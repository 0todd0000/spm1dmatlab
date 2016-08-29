

clear;  clc


%(0) Load dataset:
dataset = spm1d.data.uv0d.anova2rm.Antidepressant();
% dataset = spm1d.data.uv0d.anova2rm.RSXLTraining();
% dataset = spm1d.data.uv0d.anova2rm.SocialNetworks();
% dataset = spm1d.data.uv0d.anova2rm.Southampton2rm();
[y,A,B,SUBJ] = deal(dataset.Y, dataset.A, dataset.B, dataset.SUBJ);



%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
iterations = 500;
FFn        = spm1d.stats.nonparam.anova2rm(y, A, B, SUBJ);
FFni       = FFn.inference(alpha, 'iterations', iterations);
fprintf('NON-PARAMETRIC RESULTS\n')
disp_summ(FFni)



%(2) Compare to parametric inference:
FFi        = spm1d.stats.anova2rm(y, A, B, SUBJ).inference(alpha);
fprintf('\n\nPARAMETRIC RESULTS\n')
disp_summ( FFi )

