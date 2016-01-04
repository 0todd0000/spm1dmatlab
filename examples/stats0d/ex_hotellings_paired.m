

clear;  clc


%(0) Load dataset:
dataset  = spm1d.data.mv0d.hotellings_paired.NCSSBeforeAfter();
% dataset  = spm1d.data.mv0d.hotellings_paired.RSXLHotellingsPaired();
[yA,yB]   = deal(dataset.YA, dataset.YB);
fprintf('Expected results:\n')
fprintf('    T2 = %s\n', dataset.z)
fprintf('    df = (%s)\n', num2str(dataset.df))
fprintf('    p  = %s\n', dataset.p)


  
%(1) Conduct test using spm1d:
spm  = spm1d.stats.hotellings_paired(yA, yB);
spmi = spm.inference(0.05);
disp(spmi)














