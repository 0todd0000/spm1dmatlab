    

clear;  clc


%(0) Load dataset:
dataset = spm1d.data.uv1d.tpaired.PlantarArchAngle();
[YA,YB] = deal(dataset.YA, dataset.YB);



%(0a) Create region(s) of interest (ROI):
roi        = false( 1, size(YA,2) );
roi(1:10)  = true;




%(1) Conduct SPM analysis:
spm       = spm1d.stats.ttest_paired(YA, YB, 'roi', roi);
spmi      = spm.inference(0.05, 'two_tailed', false);
disp(spmi)


%(2) Plot:
close all
spmi.plot()
spmi.plot_threshold_label();
spmi.plot_p_values();

















