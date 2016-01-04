

clear;  clc


%(0) Load dataset:
dataset = spm1d.data.uv0d.anova2.Detergent();
% dataset = spm1d.data.uv0d.anova2.Mouse();
% dataset = spm1d.data.uv0d.anova2.Satisfaction();
% dataset = spm1d.data.uv0d.anova2.SouthamptonCrossed1();
[y,A,B] = deal(dataset.Y, dataset.A, dataset.B);
disp(dataset)





%(1) Conduct test using spm1d:
spmlist  = spm1d.stats.anova2(y, A, B);
spmilist = spmlist.inference(0.05);
disp_summ(spmilist)
















