

clear;  clc


%(0) Load dataset:
dataset = spm1d.data.uv0d.anova2nested.QIMacros();
% dataset = spm1d.data.uv0d.anova2nested.SouthamptonNested1();
[y,A,B] = deal(dataset.Y, dataset.A, dataset.B);



%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
iterations = 500;
FFn        = spm1d.stats.nonparam.anova2nested(y, A, B);
FFni       = FFn.inference(alpha, 'iterations', iterations);
fprintf('NON-PARAMETRIC RESULTS\n')
disp_summ(FFni)





%(2) Compare to parametric inference:
FFi        = spm1d.stats.anova2nested(y, A, B).inference(alpha);
fprintf('\n\nPARAMETRIC RESULTS\n')
disp_summ( FFi )




