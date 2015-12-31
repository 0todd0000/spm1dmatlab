

clear;  clc


%(0) Load dataset:
dataset  = spm1d.data.mv0d.cca.FitnessClub();
% dataset  = spm1d.data.mv0d.cca.StackExchange();
[y,x]  = deal(dataset.Y, dataset.x);
fprintf('Expected results:\n')
fprintf('    X2 = %s\n', dataset.z)
fprintf('    df = (%s)\n', num2str(dataset.df))
fprintf('    p  = %s\n', dataset.p)



%(1) Conduct test using spm1d:
spm = spm1d.stats.cca(y, x);
spmi = spm.inference(0.05); 
disp(spmi)


%(2) Compare to Statistics Toolbox result:
v = ver;
if any(strncmp('Statistics', {v.Name}, 10))
    [A,B,R,U,V,STATS] = canoncorr(x, y);
    [X2,p] = deal(STATS.chisq, STATS.p);
    fprintf('Statistics Toolbox results:\n')
    fprintf('    X2 = %s\n', X2)
    fprintf('    p  = %s\n', p)
end

