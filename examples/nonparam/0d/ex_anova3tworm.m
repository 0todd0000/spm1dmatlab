

clear;  clc


%(0) Load dataset:
% dataset = spm1d.data.uv0d.anova3tworm.NYUHiringExperience();
dataset = spm1d.data.uv0d.anova3tworm.Southampton3tworm();
[y,A,B,C,SUBJ] = deal(dataset.Y, dataset.A, dataset.B, dataset.C, dataset.SUBJ);



%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
iterations = 500;
FFn        = spm1d.stats.nonparam.anova3tworm(y, A, B, C, SUBJ);
FFni       = FFn.inference(alpha, 'iterations', iterations);
fprintf('NON-PARAMETRIC RESULTS\n')
disp_summ(FFni)



%(2) Compare to parametric inference:
FFi        = spm1d.stats.anova3tworm(y, A, B, C, SUBJ).inference(alpha);
fprintf('\n\nPARAMETRIC RESULTS\n')
disp_summ( FFi )


