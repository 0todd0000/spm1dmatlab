
classdef test_1d_np < matlab.unittest.TestCase
    methods (TestMethodSetup)
        function setup(testCase)
            % Setup code
        end
    end

    methods (TestMethodTeardown)
        function teardown(testCase)
            % Teardown code
        end
    end

    methods (Test)
    
        %--------------------------------------------------
        %  t-like test cases
        %--------------------------------------------------
    
        function test_ttest(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names  = {'Random', 'SimulatedPataky2015a', 'SimulatedPataky2015b'};
            for i = 1:numel(names)
                name      = names{i};
                data      = eval(   sprintf('spm1d.data.uv1d.t1.%s();', name)   );
                spm       = spm1d.stats.nonparam.ttest(data.Y, data.mu).inference(0.05, 'two_tailed', false, 'iterations', -1);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam1d', sprintf('%s.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                verifyThat(testCase, spm, IsEqualTo(expected.spm, 'Using',comps,'Within', RelativeTolerance(1e-6)))
            end
        end

        function test_paired(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names  = {'PlantarArchAngle'};
            for i = 1:numel(names)
                name      = names{i};
                data      = eval(   sprintf('spm1d.data.uv1d.tpaired.%s();', name)   );
                spm       = spm1d.stats.nonparam.ttest_paired(data.YA, data.YB).inference(0.05, 'two_tailed', true, 'iterations', -1);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam1d', sprintf('%sPaired.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                verifyThat(testCase, spm, IsEqualTo(expected.spm, 'Using',comps,'Within', RelativeTolerance(1e-6)))
            end
        end

        function test2(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names  = {'PlantarArchAngle'};
            for i = 1:numel(names)
                rng(0);
                name      = names{i};
                data      = eval(   sprintf('spm1d.data.uv1d.t2.%s();', name)   );
                spm       = spm1d.stats.nonparam.ttest2(data.YA, data.YB).inference(0.05, 'two_tailed', true, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam1d', sprintf('%s.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                verifyThat(testCase, spm, IsEqualTo(expected.spm, 'Using',comps,'Within', RelativeTolerance(1e-6)))
            end
        end

        function regress(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names  = {'SimulatedPataky2015c','SpeedGRF'};
            for i = 1:numel(names)
                rng(0);
                name      = names{i};
                data      = eval(   sprintf('spm1d.data.uv1d.regress.%s();', name)   );
                spm       = spm1d.stats.nonparam.regress(data.Y, data.x).inference(0.05, 'two_tailed', true, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam1d', sprintf('%s.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                verifyThat(testCase, spm, IsEqualTo(expected.spm, 'Using',comps,'Within', RelativeTolerance(1e-6)))
            end
        end

        %--------------------------------------------------
        %  ANOVA cases
        %--------------------------------------------------

        function anova1(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names = {'SpeedGRFcategorical', 'Weather'};
            for i = 1:numel(names)
                rng(0);
                name      = names{i};
                data      = eval(   sprintf('spm1d.data.uv1d.anova1.%s();', name)   );
                spm       = spm1d.stats.nonparam.anova1(data.Y, data.A).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam1d', sprintf('%s.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                verifyThat(testCase, spm, IsEqualTo(expected.spm, 'Using',comps,'Within', RelativeTolerance(1e-6)))
            end
        end

        function anova1rm(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            warning('off','all')
            names = {'SpeedGRFcategoricalRM'};
            for i = 1:numel(names)
                rng(0);
                name      = names{i};
                data      = eval(   sprintf('spm1d.data.uv1d.anova1rm.%s();', name)   );
                spm       = spm1d.stats.nonparam.anova1rm(data.Y, data.A, data.SUBJ).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam1d', sprintf('%s.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                verifyThat(testCase, spm, IsEqualTo(expected.spm, 'Using',comps,'Within', RelativeTolerance(1e-6)))
            end
            warning('on','all')
        end

        function anova2(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            warning('off','all')
            names = {'SPM1D_ANOVA2_2x3', 'SPM1D_ANOVA2_3x3', 'SPM1D_ANOVA2_3x4', 'SPM1D_ANOVA2_3x5', 'SPM1D_ANOVA2_4x4', 'SPM1D_ANOVA2_4x5'};
            for i = 1:numel(names)
                rng(0);
                name      = names{i};
                data      = eval(   sprintf('spm1d.data.uv1d.anova2.%s();', name)   );
                spms      = spm1d.stats.nonparam.anova2(data.Y, data.A, data.B).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam1d', sprintf('%s.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                for ii = 1:numel(spms)
                    verifyThat(testCase, spms(ii), IsEqualTo(expected.spm(ii), 'Using',comps,'Within', RelativeTolerance(1e-6)))
                end
            end
            warning('on','all')
        end

        function anova2nested(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            warning('off','all')
            names = {'SPM1D_ANOVA2NESTED_2x3', 'SPM1D_ANOVA2NESTED_3x3', 'SPM1D_ANOVA2NESTED_3x4', 'SPM1D_ANOVA2NESTED_3x5', 'SPM1D_ANOVA2NESTED_4x4', 'SPM1D_ANOVA2NESTED_4x5'};
            for i = 1:numel(names)
                rng(0);
                name      = names{i};
                data      = eval(   sprintf('spm1d.data.uv1d.anova2nested.%s();', name)   );
                spms      = spm1d.stats.nonparam.anova2nested(data.Y, data.A, data.B).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam1d', sprintf('%s.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                for ii = 1:numel(spms)
                    verifyThat(testCase, spms(ii), IsEqualTo(expected.spm(ii), 'Using',comps,'Within', RelativeTolerance(1e-6)))
                end
            end
            warning('on','all')
        end

        function anova2onerm(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            warning('off','all')
            names = {'SPM1D_ANOVA2ONERM_2x3', 'SPM1D_ANOVA2ONERM_3x3', 'SPM1D_ANOVA2ONERM_3x4', 'SPM1D_ANOVA2ONERM_3x5', 'SPM1D_ANOVA2ONERM_4x4', 'SPM1D_ANOVA2ONERM_4x5'};
            for i = 1:numel(names)
                rng(0);
                name      = names{i};
                data      = eval(   sprintf('spm1d.data.uv1d.anova2onerm.%s();', name)   );
                spms      = spm1d.stats.nonparam.anova2onerm(data.Y, data.A, data.B, data.SUBJ).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam1d', sprintf('%s.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                for ii = 1:numel(spms)
                    verifyThat(testCase, spms(ii), IsEqualTo(expected.spm(ii), 'Using',comps,'Within', RelativeTolerance(1e-6)))
                end
            end
            warning('on','all')
        end

        function anova2rm(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            warning('off','all')
            names = {'SPM1D_ANOVA2RM_2x3', 'SPM1D_ANOVA2RM_3x3', 'SPM1D_ANOVA2RM_3x4', 'SPM1D_ANOVA2RM_3x5', 'SPM1D_ANOVA2RM_4x4', 'SPM1D_ANOVA2RM_4x5'};
            for i = 1:numel(names)
                rng(0);
                name      = names{i};
                data      = eval(   sprintf('spm1d.data.uv1d.anova2rm.%s();', name)   );
                spms      = spm1d.stats.nonparam.anova2rm(data.Y, data.A, data.B, data.SUBJ).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam1d', sprintf('%s.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                for ii = 1:numel(spms)
                    verifyThat(testCase, spms(ii), IsEqualTo(expected.spm(ii), 'Using',comps,'Within', RelativeTolerance(1e-6)))
                end
            end
            warning('on','all')
        end

        function anova3(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            warning('off','all')
            names = {'SPM1D_ANOVA3_2x2x2', 'SPM1D_ANOVA3_2x3x4'};
            for i = 1:numel(names)
                rng(0);
                name      = names{i};
                data      = eval(   sprintf('spm1d.data.uv1d.anova3.%s();', name)   );
                spms      = spm1d.stats.nonparam.anova3(data.Y, data.A, data.B, data.C).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam1d', sprintf('%s.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                for ii = 1:numel(spms)
                    verifyThat(testCase, spms(ii), IsEqualTo(expected.spm(ii), 'Using',comps,'Within', RelativeTolerance(1e-6)))
                end
            end
            warning('on','all')
        end

        function anova3nested(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            warning('off','all')
            names = {'SPM1D_ANOVA3NESTED_2x2x2', 'SPM1D_ANOVA3NESTED_2x4x2'};
            for i = 1:numel(names)
                rng(0);
                name      = names{i};
                data      = eval(   sprintf('spm1d.data.uv1d.anova3nested.%s();', name)   );
                spms      = spm1d.stats.nonparam.anova3nested(data.Y, data.A, data.B, data.C).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam1d', sprintf('%s.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                for ii = 1:numel(spms)
                    verifyThat(testCase, spms(ii), IsEqualTo(expected.spm(ii), 'Using',comps,'Within', RelativeTolerance(1e-6)))
                end
            end
            warning('on','all')
        end

        function anova3onerm(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            warning('off','all')
            names = {'SPM1D_ANOVA3ONERM_2x2x2', 'SPM1D_ANOVA3ONERM_2x3x4'};
            for i = 1:numel(names)
                rng(0);
                name      = names{i};
                data      = eval(   sprintf('spm1d.data.uv1d.anova3onerm.%s();', name)   );
                spms      = spm1d.stats.nonparam.anova3onerm(data.Y, data.A, data.B, data.C, data.SUBJ).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam1d', sprintf('%s.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                for ii = 1:numel(spms)
                    verifyThat(testCase, spms(ii), IsEqualTo(expected.spm(ii), 'Using',comps,'Within', RelativeTolerance(1e-6)))
                end
            end
            warning('on','all')
        end

        function anova3tworm(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            warning('off','all')
            names = {'SPM1D_ANOVA3TWORM_2x2x2', 'SPM1D_ANOVA3TWORM_2x3x4'};
            for i = 1:numel(names)
                rng(0);
                name      = names{i};
                data      = eval(   sprintf('spm1d.data.uv1d.anova3tworm.%s();', name)   );
                spms      = spm1d.stats.nonparam.anova3tworm(data.Y, data.A, data.B, data.C, data.SUBJ).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam1d', sprintf('%s.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                for ii = 1:numel(spms)
                    verifyThat(testCase, spms(ii), IsEqualTo(expected.spm(ii), 'Using',comps,'Within', RelativeTolerance(1e-6)))
                end
            end
            warning('on','all')
        end

        function anova3rm(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            warning('off','all')
            names = {'SPM1D_ANOVA3RM_2x2x2', 'SPM1D_ANOVA3RM_2x3x4'};
            for i = 1:numel(names)
                rng(0);
                name      = names{i};
                data      = eval(   sprintf('spm1d.data.uv1d.anova3rm.%s();', name)   );
                spms      = spm1d.stats.nonparam.anova3rm(data.Y, data.A, data.B, data.C, data.SUBJ).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam1d', sprintf('%s.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                for ii = 1:numel(spms)
                    verifyThat(testCase, spms(ii), IsEqualTo(expected.spm(ii), 'Using',comps,'Within', RelativeTolerance(1e-6)))
                end
            end
            warning('on','all')
        end

        %--------------------------------------------------
        %  MULTIVARIATE cases
        %--------------------------------------------------

        function cca(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            warning('off','all')
            names = {'Dorn2012'};
            for i = 1:numel(names)
                rng(0);
                name      = names{i};
                data      = eval(   sprintf('spm1d.data.mv1d.cca.%s();', name)   );
                spm       = spm1d.stats.nonparam.cca(data.Y, data.x).inference(0.05, 'iterations', 200);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam1d', sprintf('%s.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                verifyThat(testCase, spm, IsEqualTo(expected.spm, 'Using',comps,'Within', RelativeTolerance(1e-6)))
            end
            warning('on','all')
        end

        function hotellings_paired(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            warning('off','all')
            names  = {'Neptune1999kneekin', 'Pataky2014cop'};
            for i = 1:numel(names)
                rng(0);
                name      = names{i};
                data      = eval(   sprintf('spm1d.data.mv1d.hotellings_paired.%s();', name)   );
                spm       = spm1d.stats.nonparam.hotellings_paired(data.YA, data.YB).inference(0.05, 'iterations', 200);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam1d', sprintf('%s.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                verifyThat(testCase, spm, IsEqualTo(expected.spm, 'Using',comps,'Within', RelativeTolerance(1e-6)))
            end
            warning('on','all')
        end

        function hotellings2(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            warning('off','all')
            names = {'Besier2009muscleforces'};
            for i = 1:numel(names)
                rng(0);
                name      = names{i};
                data      = eval(   sprintf('spm1d.data.mv1d.hotellings2.%s();', name)   );
                spm       = spm1d.stats.nonparam.hotellings2(data.YA, data.YB).inference(0.05, 'iterations', 200);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam1d', sprintf('%s.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                verifyThat(testCase, spm, IsEqualTo(expected.spm, 'Using',comps,'Within', RelativeTolerance(1e-6)))
            end
            warning('on','all')
        end

        
    end
end


