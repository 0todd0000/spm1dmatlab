

clear;  clc


%(0) Load dataset:
dataset  = spm1d.data.uv0d.regress.RSRegression();
dataset  = spm1d.data.uv0d.regress.ColumbiaHeadCircumference();
[y,x]  = deal(dataset.Y, dataset.x);
disp(dataset)
% fprintf('Expected results:\n')
% fprintf('    t = %s\n', dataset.z)
% fprintf('    df = (%s)\n', num2str(dataset.df))
% fprintf('    p = %s\n', dataset.p)


%(1) Conduct test using spm1d:
spm = spm1d.stats.regress(y, x);
spmi = spm.inference(0.05, 'two_tailed', true);
disp(spmi)


%(2) Compare to Statistics Toolbox result:
v = ver;
if any(strncmp('Statistics', {v.Name}, 10))
    X = [x ones(numel(x),1)];
    [b,bint,r,rint,stats] = regress(y,X);
    [t,p] = deal( sqrt(stats(2)), stats(3) );
    fprintf('Statistics Toolbox results:\n')
    fprintf('    t = %s\n', t)
    fprintf('    p = %s\n', p)
end


















