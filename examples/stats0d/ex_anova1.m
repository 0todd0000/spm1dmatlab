

clear;  clc


%(0) Load dataset:
dataset = spm1d.data.uv0d.anova1.Cars();
% dataset = spm1d.data.uv0d.anova1.Sound();
% dataset = spm1d.data.uv0d.anova1.Southampton1();
% dataset = spm1d.data.uv0d.anova1.ConstructionUnequalSampleSizes();
% dataset = spm1d.data.uv0d.anova1.RSUnequalSampleSizes();
[y,A] = deal(dataset.Y, dataset.A);
% fprintf('Expected results:\n')
% fprintf('    F = %s\n', dataset.z)
% fprintf('    df = (%s)\n', num2str(dataset.df))
% fprintf('    p = %s\n', dataset.p)




%(1) Run ANOVA:
spm  = spm1d.stats.anova1(y, A);
spmi = spm.inference(0.05);
% disp(spm)
disp(spmi)



%(2) Compare to Statistics Toolbox result:
v = ver;
if any(strncmp('Statistics', {v.Name}, 10))
    [p,table] = anova1(y, A, 'off');
    F = table{2,5};
    fprintf('Statistics Toolbox results:\n')
    fprintf('    F = %.5f\n', F)
    fprintf('    p = %.5f\n', p)
end













