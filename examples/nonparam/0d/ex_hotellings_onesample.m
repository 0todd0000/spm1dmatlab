

clear;  clc


%(0) Load dataset:
dataset  = spm1d.data.mv0d.hotellings1.RSXLHotellings1();
% dataset  = spm1d.data.mv0d.hotellings1.Sweat();
[y,mu]   = deal(dataset.Y, dataset.mu);
fprintf('Expected results:\n')
fprintf('    T2 = %s\n', dataset.z)
fprintf('    df = (%s)\n', num2str(dataset.df))
fprintf('    p  = %s\n', dataset.p)


  
%(1) Conduct test using spm1d:
spm  = spm1d.stats.hotellings(y, mu);
spmi = spm.inference(0.05);
disp(spmi)














