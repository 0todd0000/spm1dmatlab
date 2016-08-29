    

clear;  clc



%(0) Load data:
dataset    = spm1d.data.uv1d.anova3.SPM1D_ANOVA3_2x2x2();
% dataset    = spm1d.data.uv1d.anova3.SPM1D_ANOVA3_2x3x4();
[Y,A,B,C]  = deal(dataset.Y, dataset.A, dataset.B, dataset.C);


%(1) Conduct SPM analysis:
spmlist   = spm1d.stats.anova3(Y, A, B, C);
spmilist  = spmlist.inference(0.05);
disp_summ(spmilist)



%(2) Plot:
close all
for k = 1:spmilist.nEffects
    subplot(3,3,k)
    spmi = spmilist(k);
    spmi.plot()
    title( spmi.effect )
end


