


clear;  clc


% ttest:
names  = {'ColumbiaSalmonella', 'RSWeightReduction'};
for i = 1:numel(names)
    name   = names{i};
    d      = eval( sprintf('spm1d.data.uv0d.t1.%s();',name) );
    [y,mu] = deal(d.Y, d.mu);
    spm    = spm1d.stats.nonparam.ttest(y, mu).inference(0.05, 'two_tailed',false, 'iterations', -1);
    fpath  = fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


% ttest_paired:
names  = {'ColumbiaMileage', 'RSWeightClinic'};
for i = 1:numel(names)
    rng(0);
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv0d.tpaired.%s();',name) );
    [y0,y1] = deal(d.YA, d.YB);
    spm     = spm1d.stats.nonparam.ttest_paired(y0, y1).inference(0.05, 'two_tailed',true, 'iterations', 1000);
    fpath   = fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%sPaired.mat',name) );
    save(fpath, 'spm')
end


% ttest2:
names  = {'ColumbiaPlacebo', 'RSFlavor'};
for i = 1:numel(names)
    rng(0);
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv0d.t2.%s();',name) );
    spm     = spm1d.stats.nonparam.ttest2(d.YA, d.YB).inference(0.05, 'two_tailed',true, 'iterations', 800);
    fpath   = fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


% regress:
names  = {'ColumbiaHeadCircumference', 'RSRegression'};
for i = 1:numel(names)
    rng(0);
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv0d.regress.%s();',name) );
    spm     = spm1d.stats.nonparam.regress(d.Y, d.x).inference(0.05, 'two_tailed',true, 'iterations', 1000);
    fpath   = fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


% anova1:
names  = {'Cars', 'ConstructionUnequalSampleSizes', 'RSUnequalSampleSizes', 'Sound', 'Southampton1'};
for i = 1:numel(names)
    rng(0);
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv0d.anova1.%s();',name) );
    spm     = spm1d.stats.nonparam.anova1(d.Y, d.A).inference(0.05, 'iterations', 1000);
    fpath   = fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end

% anova1rm:
names  = {'Abdi2010', 'Groceries', 'Imacelebrity', 'Southampton1rm'};
for i = 1:numel(names)
    rng(0);
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv0d.anova1rm.%s();',name) );
    spm     = spm1d.stats.nonparam.anova1rm(d.Y, d.A, d.SUBJ).inference(0.05, 'iterations', 1000);
    fpath   = fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end

warning('off', 'all')

% anova2:
names  = {'Detergent', 'Mouse', 'Satisfaction', 'SouthamptonCrossed1'};
for i = 1:numel(names)
    rng(0);
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv0d.anova2.%s();',name) );
    spm     = spm1d.stats.nonparam.anova2(d.Y, d.A, d.B).inference(0.05, 'iterations', 1000);
    fpath   = fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


% anova2nested:
names  = {'QIMacros', 'SouthamptonNested1'};
for i = 1:numel(names)
    rng(0);
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv0d.anova2nested.%s();',name) );
    spm     = spm1d.stats.nonparam.anova2nested(d.Y, d.A, d.B).inference(0.05, 'iterations', 1000);
    fpath   = fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end

% anova2onerm:
names  = {'RSXLDrug', 'Santa23', 'Santa23UnequalSampleSizes', 'Southampton2onerm', 'Southampton2onermUnequalSampleSizes'};
for i = 1:numel(names)
    rng(0);
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv0d.anova2onerm.%s();',name) );
    spm     = spm1d.stats.nonparam.anova2onerm(d.Y, d.A, d.B, d.SUBJ).inference(0.05, 'iterations', 1000);
    fpath   = fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end

% anova2rm:
names  = {'Antidepressant', 'RSXLTraining', 'SocialNetworks', 'Southampton2rm'};
for i = 1:numel(names)
    rng(0);
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv0d.anova2rm.%s();',name) );
    spm     = spm1d.stats.nonparam.anova2rm(d.Y, d.A, d.B, d.SUBJ).inference(0.05, 'iterations', 1000);
    fpath   = fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


% anova3:
names  = {'RSItalian', 'SouthamptonFullyCrossedMixed'};
for i = 1:numel(names)
    rng(0);
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv0d.anova3.%s();',name) );
    spm     = spm1d.stats.nonparam.anova3(d.Y, d.A, d.B, d.C).inference(0.05, 'iterations', 1000);
    fpath   = fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end

% anova3nested:
names  = {'SouthamptonNested3'};
for i = 1:numel(names)
    rng(0);
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv0d.anova3nested.%s();',name) );
    spm     = spm1d.stats.nonparam.anova3nested(d.Y, d.A, d.B, d.C).inference(0.05, 'iterations', 1000);
    fpath   = fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


% anova3onerm:
names  = {'NYUCaffeine', 'Southampton3onerm'};
for i = 1:numel(names)
    rng(0);
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv0d.anova3onerm.%s();',name) );
    spm     = spm1d.stats.nonparam.anova3onerm(d.Y, d.A, d.B, d.C, d.SUBJ).inference(0.05, 'iterations', 1000);
    fpath   = fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


% anova3tworm:
names  = {'NYUHiringExperience', 'Southampton3tworm'};
for i = 1:numel(names)
    rng(0);
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv0d.anova3tworm.%s();',name) );
    spm     = spm1d.stats.nonparam.anova3tworm(d.Y, d.A, d.B, d.C, d.SUBJ).inference(0.05, 'iterations', 1000);
    fpath   = fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


% anova3rm:
names  = {'SPM1D2x2x2', 'SPM1D2x3x5', 'SPM1D3x3x3'};
for i = 1:numel(names)
    rng(0);
    name    = names{i};
    d       = eval( sprintf('spm1d.data.uv0d.anova3rm.%s();',name) );
    spm     = spm1d.stats.nonparam.anova3rm(d.Y, d.A, d.B, d.C, d.SUBJ).inference(0.05, 'iterations', 1000);
    fpath   = fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


warning('on', 'all')



% cca:
names  = {'FitnessClub', 'StackExchange'};
for i = 1:numel(names)
    rng(0);
    name    = names{i};
    d       = eval( sprintf('spm1d.data.mv0d.cca.%s();',name) );
    spm     = spm1d.stats.nonparam.cca(d.Y, d.x).inference(0.05, 'iterations', 200);
    fpath   = fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


% hotellings:
names  = {'RSXLHotellings1', 'Sweat'};
for i = 1:numel(names)
    rng(0);
    name    = names{i};
    d       = eval( sprintf('spm1d.data.mv0d.hotellings1.%s();',name) );
    spm     = spm1d.stats.nonparam.hotellings(d.Y, d.mu).inference(0.05, 'iterations', 200);
    fpath   = fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


% hotellings_paired:
names  = {'NCSSBeforeAfter', 'RSXLHotellingsPaired'};
for i = 1:numel(names)
    rng(0);
    name    = names{i};
    d       = eval( sprintf('spm1d.data.mv0d.hotellings_paired.%s();',name) );
    spm     = spm1d.stats.nonparam.hotellings_paired(d.YA, d.YB).inference(0.05, 'iterations', 200);
    fpath   = fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


% hotellings2:
names  = {'HELPHomeless', 'RSXLHotellings2'};
for i = 1:numel(names)
    rng(0);
    name    = names{i};
    d       = eval( sprintf('spm1d.data.mv0d.hotellings2.%s();',name) );
    spm     = spm1d.stats.nonparam.hotellings2(d.YA, d.YB).inference(0.05, 'iterations', 200);
    fpath   = fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end


% manova1:
names  = {'AnimalDepression', 'Stevens2002'};
for i = 1:numel(names)
    rng(0);
    name    = names{i};
    d       = eval( sprintf('spm1d.data.mv0d.manova1.%s();',name) );
    spm     = spm1d.stats.nonparam.manova1(d.Y, d.A).inference(0.05, 'iterations', 200);
    fpath   = fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',name) );
    save(fpath, 'spm')
end

