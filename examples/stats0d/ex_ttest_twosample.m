

clear;  clc


%(0) Load dataset:
dataset  = spm1d.data.uv0d.t2.RSFlavor();
% dataset  = spm1d.data.uv0d.t2.ColumbiaPlacebo();
[yA,yB]  = deal(dataset.YA, dataset.YB);
fprintf('Expected results:\n')
fprintf('    t = %s\n', dataset.z)
fprintf('    p = %s\n', dataset.p)


%(1) Conduct test using spm1d:
spm  = spm1d.stats.ttest2(yA, yB);
spmi = spm.inference(0.05, 'two_tailed', false); 
disp(spmi)


%(2) Compare to Statistics Toolbox result:
v = ver;
if any(strncmp('Statistics', {v.Name}, 10))
    [h,p,ci,stats] = ttest2(yA, yB);
    [t,p] = deal(stats.tstat, 0.5*p);   %one-tailed test
    fprintf('Statistics Toolbox results:\n')
    fprintf('    t = %s\n', t)
    fprintf('    p = %s\n', p)
end

















