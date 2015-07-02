    

clear all;  clc


%(0) Load data:
%(0) Load dataset:
dataset = spm1d.data.uv1d.tpaired.PlantarArchAngle();
[YA,YB] = deal(dataset.YA, dataset.YB);



%(1) Conduct SPM analysis:
spm       = spm1d.stats.ttest_paired(YA, YB);
spmi      = spm.inference(0.05, 'two_tailed', false);
disp(spmi)


%(2) Plot:
close all
spmi.plot()
spmi.plot_threshold_label();
spmi.plot_p_values();


%create figure and axes
% figure('Position',[100,100,800,350])
% ax0 = axes('Position', [0.10,0.15,0.35,0.8]);
% ax1 = axes('Position', [0.55,0.15,0.35,0.8]);
% %plot mean & SD curves:
% axes(ax0)
% [hA0,hA1] = spm1d_plot_meanSD(Y1);
% hold on
% [hB0,hB1] = spm1d_plot_meanSD(Y2);
% set(hA0, 'color','k')
% set(hB0, 'color','r')
% set(hB1, 'facecolor', 'r')
% legend([hA0 hB0], 'Normal', 'Fast', 'Location','SouthWest')
% xlabel('Time (%)')
% ylabel('\Delta \theta   (MF - MT)')
% %plot SPM results:
% axes(ax1)
% spm1d_plot_SPMi(SPMi)
% spm1d_plot_SPMi_label_threshold(SPMi, 30, 4.1);
% ylim([-1.5 6.5])
% text(80, 4.2, sprintf('p = %.03f',SPMi.p));  %p value
% xlabel('Time (%)')
% ylabel('SPM \{ t \}')
% 
% 

















