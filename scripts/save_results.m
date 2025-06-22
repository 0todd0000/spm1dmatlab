


clear;  clc


% % ttest:
% names = {'Random', 'SimulatedPataky2015a', 'SimulatedPataky2015b'};
% for i = 1:numel(names)
%     name   = names{i};
%     d      = eval( sprintf('spm1d.data.uv1d.t1.%s();',name) );
%     [y,mu] = deal(d.Y, d.mu);
%     spm    = spm1d.stats.ttest(y - mu).inference(0.05, 'two_tailed',false);
%     fpath  = fullfile(spm1d.path, 'results', sprintf('%s.mat',name) );
%     save(fpath, 'spm')
% end
%
%
% % ttest_paired:
% names = {'PlantarArchAngle'};
% for i = 1:numel(names)
%     name    = names{i};
%     d       = eval( sprintf('spm1d.data.uv1d.tpaired.%s();',name) );
%     [y0,y1] = deal(d.YA, d.YB);
%     spm     = spm1d.stats.ttest_paired(y0, y1).inference(0.05, 'two_tailed',true);
%     fpath   = fullfile(spm1d.path, 'results', sprintf('%sPaired.mat',name) );
%     save(fpath, 'spm')
% end
%
%
% % ttest2:
% names = {'PlantarArchAngle'};
% for i = 1:numel(names)
%     name    = names{i};
%     d       = eval( sprintf('spm1d.data.uv1d.t2.%s();',name) );
%     spm     = spm1d.stats.ttest2(d.YA, d.YB).inference(0.05, 'two_tailed',true);
%     fpath   = fullfile(spm1d.path, 'results', sprintf('%s.mat',name) );
%     save(fpath, 'spm')
% end


% % regress:
% names  = {'SimulatedPataky2015c','SpeedGRF'};
% for i = 1:numel(names)
%     name    = names{i};
%     d       = eval( sprintf('spm1d.data.uv1d.regress.%s();',name) );
%     spm     = spm1d.stats.regress(d.Y, d.x).inference(0.05, 'two_tailed',true);
%     fpath   = fullfile(spm1d.path, 'results', sprintf('%s.mat',name) );
%     save(fpath, 'spm')
% end


% anova1:
names = {'SpeedGRFcategorical', 'Weather'};
for i = 1:numel(names)
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv1d.anova1.%s();',name) );
    spm     = spm1d.stats.anova1(d.Y, d.A).inference(0.05);
    fpath   = fullfile(spm1d.path, 'results', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end

% anova1rm:
names = {'SpeedGRFcategoricalRM'};
for i = 1:numel(names)
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv1d.anova1rm.%s();',name) );
    spm     = spm1d.stats.anova1rm(d.Y, d.A, d.SUBJ).inference(0.05);
    fpath   = fullfile(spm1d.path, 'results', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end

warning('off', 'all')

% anova2:
names = {'SPM1D_ANOVA2_2x3', 'SPM1D_ANOVA2_3x3', 'SPM1D_ANOVA2_3x4', 'SPM1D_ANOVA2_3x5', 'SPM1D_ANOVA2_4x4', 'SPM1D_ANOVA2_4x5'};
for i = 1:numel(names)
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv1d.anova2.%s();',name) );
    spm     = spm1d.stats.anova2(d.Y, d.A, d.B).inference(0.05);
    fpath   = fullfile(spm1d.path, 'results', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


% anova2nested:
names = {'SPM1D_ANOVA2NESTED_2x3', 'SPM1D_ANOVA2NESTED_3x3', 'SPM1D_ANOVA2NESTED_3x4', 'SPM1D_ANOVA2NESTED_3x5', 'SPM1D_ANOVA2NESTED_4x4', 'SPM1D_ANOVA2NESTED_4x5'};
for i = 1:numel(names)
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv1d.anova2nested.%s();',name) );
    spm     = spm1d.stats.anova2nested(d.Y, d.A, d.B).inference(0.05);
    fpath   = fullfile(spm1d.path, 'results', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end

% anova2onerm:
names = {'SPM1D_ANOVA2ONERM_2x3', 'SPM1D_ANOVA2ONERM_3x3', 'SPM1D_ANOVA2ONERM_3x4', 'SPM1D_ANOVA2ONERM_3x5', 'SPM1D_ANOVA2ONERM_4x4', 'SPM1D_ANOVA2ONERM_4x5'};
for i = 1:numel(names)
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv1d.anova2onerm.%s();',name) );
    spm     = spm1d.stats.anova2onerm(d.Y, d.A, d.B, d.SUBJ).inference(0.05);
    fpath   = fullfile(spm1d.path, 'results', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end

% anova2rm:
names = {'SPM1D_ANOVA2RM_2x3', 'SPM1D_ANOVA2RM_3x3', 'SPM1D_ANOVA2RM_3x4', 'SPM1D_ANOVA2RM_3x5', 'SPM1D_ANOVA2RM_4x4', 'SPM1D_ANOVA2RM_4x5'};
for i = 1:numel(names)
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv1d.anova2rm.%s();',name) );
    spm     = spm1d.stats.anova2rm(d.Y, d.A, d.B, d.SUBJ).inference(0.05);
    fpath   = fullfile(spm1d.path, 'results', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


% anova3:
names = {'SPM1D_ANOVA3_2x2x2', 'SPM1D_ANOVA3_2x3x4'};
for i = 1:numel(names)
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv1d.anova3.%s();',name) );
    spm     = spm1d.stats.anova3(d.Y, d.A, d.B, d.C).inference(0.05);
    fpath   = fullfile(spm1d.path, 'results', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end

% anova3nested:
names = {'SPM1D_ANOVA3NESTED_2x2x2', 'SPM1D_ANOVA3NESTED_2x4x2'};
for i = 1:numel(names)
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv1d.anova3nested.%s();',name) );
    spm     = spm1d.stats.anova3nested(d.Y, d.A, d.B, d.C).inference(0.05);
    fpath   = fullfile(spm1d.path, 'results', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


% anova3onerm:
names = {'SPM1D_ANOVA3ONERM_2x2x2', 'SPM1D_ANOVA3ONERM_2x3x4'};
for i = 1:numel(names)
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv1d.anova3onerm.%s();',name) );
    spm     = spm1d.stats.anova3onerm(d.Y, d.A, d.B, d.C, d.SUBJ).inference(0.05);
    fpath   = fullfile(spm1d.path, 'results', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


% anova3tworm:
names = {'SPM1D_ANOVA3TWORM_2x2x2', 'SPM1D_ANOVA3TWORM_2x3x4'};
for i = 1:numel(names)
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv1d.anova3tworm.%s();',name) );
    spm     = spm1d.stats.anova3tworm(d.Y, d.A, d.B, d.C, d.SUBJ).inference(0.05);
    fpath   = fullfile(spm1d.path, 'results', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


% anova3rm:
names = {'SPM1D_ANOVA3RM_2x2x2', 'SPM1D_ANOVA3RM_2x3x4'};
for i = 1:numel(names)
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv1d.anova3rm.%s();',name) );
    spm     = spm1d.stats.anova3rm(d.Y, d.A, d.B, d.C, d.SUBJ).inference(0.05);
    fpath   = fullfile(spm1d.path, 'results', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


warning('on', 'all')



% cca:
names  = {'Dorn2012'};
for i = 1:numel(names)
    name    = names{i};
    d       = eval( sprintf('spm1d.data.mv1d.cca.%s();',name) );
    spm     = spm1d.stats.cca(d.Y, d.x).inference(0.05);
    fpath   = fullfile(spm1d.path, 'results', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


% hotellings_paired:
names  = {'Neptune1999kneekin', 'Pataky2014cop'};
for i = 1:numel(names)
    name    = names{i};
    d       = eval( sprintf('spm1d.data.mv1d.hotellings_paired.%s();',name) );
    spm     = spm1d.stats.hotellings_paired(d.YA, d.YB).inference(0.05);
    fpath   = fullfile(spm1d.path, 'results', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


% hotellings2:
names  = {'Besier2009muscleforces'};
for i = 1:numel(names)
    name    = names{i};
    d       = eval( sprintf('spm1d.data.mv1d.hotellings2.%s();',name) );
    spm     = spm1d.stats.hotellings2(d.YA, d.YB).inference(0.05);
    fpath   = fullfile(spm1d.path, 'results', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


