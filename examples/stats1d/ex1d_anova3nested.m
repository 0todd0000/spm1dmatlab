    

clear;  clc


%(0) Load data:
dataset    = spm1d.data.uv1d.anova3nested.SPM1D_ANOVA3NESTED_2x2x2();
dataset    = spm1d.data.uv1d.anova3nested.SPM1D_ANOVA3NESTED_2x4x2();
[Y,A,B,C]  = deal(dataset.Y, dataset.A, dataset.B, dataset.C);


%(1) Conduct SPM analysis:
spmlist   = spm1d.stats.anova3nested(Y, A, B, C);
spmlisti  = spmlist.inference(0.05);


%(2) Plot: 
close all
titles = {'Main effect A', 'Main effect B', 'Main effect C'};
for k = 1:spmlist.n
    subplot(2,2,k)
    spmi = spmlisti.SPMs{k};
    plot(spmi)
    title(titles{k})
end
    









