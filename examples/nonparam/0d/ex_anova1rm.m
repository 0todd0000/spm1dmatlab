

clear;  clc


%(0) Load dataset:
dataset    = spm1d.data.uv0d.anova1rm.Abdi2010();
dataset    = spm1d.data.uv0d.anova1rm.Groceries();
% dataset    = spm1d.data.uv0d.anova1rm.Imacelebrity();
% dataset    = spm1d.data.uv0d.anova1rm.Southampton1rm();
[y,A,SUBJ] = deal(dataset.Y, dataset.A, dataset.SUBJ);
fprintf('Expected results:\n')
fprintf('    F = %s\n', dataset.z)
fprintf('    df = (%s)\n', num2str(dataset.df))
fprintf('    p = %s\n', dataset.p)




%(1) Conduct test using spm1d:
spm  = spm1d.stats.anova1rm(y, A, SUBJ);
spmi = spm.inference(0.05);
disp(spmi)



