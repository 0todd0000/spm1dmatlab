


clear;  clc


% ttest:
names = {'Random', 'SimulatedPataky2015a', 'SimulatedPataky2015b'};
for i = 1:numel(names)
    name   = names{i};
    d      = eval( sprintf('spm1d.data.uv1d.t1.%s();',name) );
    [y,mu] = deal(d.Y, d.mu);
    spm    = spm1d.stats.ttest(y - mu).inference(0.05, 'two_tailed',false);
    fpath  = fullfile(spm1d.path, 'results', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


% ttest_paired:
names = {'PlantarArchAngle'};
for i = 1:numel(names)
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv1d.tpaired.%s();',name) );
    [y0,y1] = deal(d.YA, d.YB);
    spm     = spm1d.stats.ttest_paired(y0, y1).inference(0.05, 'two_tailed',true);
    fpath   = fullfile(spm1d.path, 'results', sprintf('%sPaired.mat',name) );
    save(fpath, 'spm')
end


% ttest2:
names = {'PlantarArchAngle'};
for i = 1:numel(names)
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv1d.tpaired.%s();',name) );
    spm     = spm1d.stats.ttest2(d.YA, d.YB).inference(0.05, 'two_tailed',true);
    fpath   = fullfile(spm1d.path, 'results', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


