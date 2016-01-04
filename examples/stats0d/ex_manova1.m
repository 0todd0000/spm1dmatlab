

clear;  clc


%(0) Load dataset:
dataset  = spm1d.data.mv0d.manova1.AnimalDepression();
% dataset  = spm1d.data.mv0d.manova1.Stevens2002();
[y,A]  = deal(dataset.Y, dataset.A);
fprintf('Expected results:\n')
fprintf('    X2 = %s\n', dataset.z)
fprintf('    df = (%s)\n', num2str(dataset.df))
fprintf('    p  = %s\n', dataset.p)





%(1) Conduct test using spm1d:
spm = spm1d.stats.manova1(y, A);
spmi = spm.inference(0.05); 
disp(spmi)



%(2) Compare to Statistics Toolbox result:
v = ver;
if any(strncmp('Statistics', {v.Name}, 10))
    [d,p,stats] = manova1(y, A);
    fprintf('Statistics Toolbox results:\n')
    fprintf('    X2 = %s\n', stats.chisq(1))
    fprintf('    p  = %s\n', p(1))
end


