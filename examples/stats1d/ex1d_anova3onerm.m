    

clear;  clc



%(0) Load data:
dataset    = spm1d.data.uv1d.anova3onerm.SPM1D_ANOVA3ONERM_2x2x2();
% dataset    = spm1d.data.uv1d.anova3onerm.SPM1D_ANOVA3ONERM_2x3x4();
[Y,A,B,C,SUBJ]  = deal(dataset.Y, dataset.A, dataset.B, dataset.C, dataset.SUBJ);


%(1) Conduct SPM analysis:
spmlist   = spm1d.stats.anova3onerm(Y, A, B, C, SUBJ);
spmlisti  = spmlist.inference(0.05);


%(2) Plot: 
close all
titles = {'Main effect A', 'Main effect B', 'Main effect C',...
    'Interaction AB', 'Interaction AC', 'Interaction BC', 'Interaction ABC'};
for k = 1:spmlist.n
    subplot(3,3,k)
    spmi = spmlisti.SPMs{k};
    plot(spmi)
    title(titles{k})
end
    









