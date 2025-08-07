classdef test_0d_np < matlab.unittest.TestCase
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
            names  = {'ColumbiaSalmonella', 'RSWeightReduction'};
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv0d.t1.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.nonparam.ttest(data.Y, data.mu).inference(0.05, two_tailed=false, iterations=-1);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',names{i}) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                verifyThat(testCase, spm, IsEqualTo(expected.spm, 'Using',comps,'Within', RelativeTolerance(1e-6)))
            end
        end

        function test_ttest_paired(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names  = {'ColumbiaMileage', 'RSWeightClinic'};
            for i = 1:numel(names)
                rng(0);
                cmd  = sprintf('spm1d.data.uv0d.tpaired.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.nonparam.ttest_paired(data.YA, data.YB).inference(0.05, two_tailed=true, iterations=1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%sPaired.mat',names{i}) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                verifyThat(testCase, spm, IsEqualTo(expected.spm, 'Using',comps,'Within', RelativeTolerance(1e-6)))
            end
        end

        function test_ttest2(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names  = {'ColumbiaPlacebo', 'RSFlavor'};
            for i = 1:numel(names)
                rng(0);
                cmd  = sprintf('spm1d.data.uv0d.t2.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.nonparam.ttest2(data.YA, data.YB).inference(0.05, two_tailed=true, iterations=800);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',names{i}) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                verifyThat(testCase, spm, IsEqualTo(expected.spm, 'Using',comps,'Within', RelativeTolerance(1e-6)))
            end
        end

        function test_regress(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names  = {'ColumbiaHeadCircumference', 'RSRegression'};
            for i = 1:numel(names)
                rng(0);
                cmd  = sprintf('spm1d.data.uv0d.regress.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.nonparam.regress(data.Y, data.x).inference(0.05, two_tailed=true, iterations=1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',names{i}) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                verifyThat(testCase, spm, IsEqualTo(expected.spm, 'Using',comps,'Within', RelativeTolerance(1e-6)))
            end
        end



        %--------------------------------------------------
        %  ANOVA test cases
        %--------------------------------------------------

        function test_anova1(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names  = {'Cars', 'ConstructionUnequalSampleSizes', 'RSUnequalSampleSizes', 'Sound', 'Southampton1'};
            for i = 1:numel(names)
                rng(0);
                cmd  = sprintf('spm1d.data.uv0d.anova1.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.nonparam.anova1(data.Y, data.A).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',names{i}) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                verifyThat(testCase, spm, IsEqualTo(expected.spm, 'Using',comps,'Within', RelativeTolerance(1e-6)))
            end
        end


        function test_anova1rm(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names  = {'Abdi2010', 'Groceries', 'Imacelebrity', 'Southampton1rm'};
            for i = 1:numel(names)
                rng(0);
                cmd  = sprintf('spm1d.data.uv0d.anova1rm.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.nonparam.anova1rm(data.Y, data.A, data.SUBJ).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',names{i}) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                verifyThat(testCase, spm, IsEqualTo(expected.spm, 'Using',comps,'Within', RelativeTolerance(1e-6)))
            end
        end


        function test_anova2(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names  = {'Detergent', 'Mouse', 'Satisfaction', 'SouthamptonCrossed1'};
            for i = 1:numel(names)
                rng(0);
                cmd  = sprintf('spm1d.data.uv0d.anova2.%s();', names{i});
                data = eval(cmd);
                spms = spm1d.stats.nonparam.anova2(data.Y, data.A, data.B).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',names{i}) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                for ii = 1:numel(spms)
                    verifyThat(testCase, spms(ii), IsEqualTo(expected.spm(ii), 'Using',comps,'Within', RelativeTolerance(1e-6)))
                end
            end
        end


        function test_anova2nested(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names  = {'QIMacros', 'SouthamptonNested1'};
            for i = 1:numel(names)
                rng(0);
                cmd  = sprintf('spm1d.data.uv0d.anova2nested.%s();', names{i});
                data = eval(cmd);
                spms = spm1d.stats.nonparam.anova2nested(data.Y, data.A, data.B).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',names{i}) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                for ii = 1:numel(spms)
                    verifyThat(testCase, spms(ii), IsEqualTo(expected.spm(ii), 'Using',comps,'Within', RelativeTolerance(1e-6)))
                end
            end
        end


        function test_anova2onerm(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names  = {'RSXLDrug', 'Santa23', 'Santa23UnequalSampleSizes', 'Southampton2onerm', 'Southampton2onermUnequalSampleSizes'};
            for i = 1:numel(names)
                rng(0);
                cmd  = sprintf('spm1d.data.uv0d.anova2onerm.%s();', names{i});
                data = eval(cmd);
                spms = spm1d.stats.nonparam.anova2onerm(data.Y, data.A, data.B, data.SUBJ).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',names{i}) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                for ii = 1:numel(spms)
                    verifyThat(testCase, spms(ii), IsEqualTo(expected.spm(ii), 'Using',comps,'Within', RelativeTolerance(1e-6)))
                end
            end
        end


        function test_anova2rm(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names  = {'Antidepressant', 'RSXLTraining', 'SocialNetworks', 'Southampton2rm'};
            for i = 1:numel(names)
                rng(0);
                cmd  = sprintf('spm1d.data.uv0d.anova2rm.%s();', names{i});
                data = eval(cmd);
                spms = spm1d.stats.nonparam.anova2rm(data.Y, data.A, data.B, data.SUBJ).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',names{i}) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                for ii = 1:numel(spms)
                    verifyThat(testCase, spms(ii), IsEqualTo(expected.spm(ii), 'Using',comps,'Within', RelativeTolerance(1e-6)))
                end
            end
        end


        function test_anova3(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names  = {'RSItalian', 'SouthamptonFullyCrossedMixed'};
            for i = 1:numel(names)
                rng(0);
                cmd  = sprintf('spm1d.data.uv0d.anova3.%s();', names{i});
                data = eval(cmd);
                spms = spm1d.stats.nonparam.anova3(data.Y, data.A, data.B, data.C).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',names{i}) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                for ii = 1:numel(spms)
                    verifyThat(testCase, spms(ii), IsEqualTo(expected.spm(ii), 'Using',comps,'Within', RelativeTolerance(1e-6)))
                end
            end
        end


        function test_anova3nested(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names  = {'SouthamptonNested3'};
            for i = 1:numel(names)
                rng(0);
                cmd  = sprintf('spm1d.data.uv0d.anova3nested.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.nonparam.anova3nested(data.Y, data.A, data.B, data.C).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',names{i}) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                verifyThat(testCase, spm, IsEqualTo(expected.spm, 'Using',comps,'Within', RelativeTolerance(1e-6)))
            end
        end


        function test_anova3onerm(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names  = {'NYUCaffeine', 'Southampton3onerm'};
            atols  = [0.4  0.1];
            for i = 1:numel(names)
                rng(0);
                cmd  = sprintf('spm1d.data.uv0d.anova3onerm.%s();', names{i});
                data = eval(cmd);
                spms = spm1d.stats.nonparam.anova3onerm(data.Y, data.A, data.B, data.C, data.SUBJ).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',names{i}) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                for ii = 1:numel(spms)
                    verifyThat(testCase, spms(ii), IsEqualTo(expected.spm(ii), 'Using',comps,'Within', RelativeTolerance(1e-6)))
                end
            end
        end


        function test_anova3rm(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names  = {'SPM1D2x2x2', 'SPM1D2x3x5', 'SPM1D3x3x3'};
            for i = 1:numel(names)
                rng(0);
                cmd  = sprintf('spm1d.data.uv0d.anova3rm.%s();', names{i});
                data = eval(cmd);
                spms = spm1d.stats.nonparam.anova3rm(data.Y, data.A, data.B, data.C, data.SUBJ).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',names{i}) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                for ii = 1:numel(spms)
                    verifyThat(testCase, spms(ii), IsEqualTo(expected.spm(ii), 'Using',comps,'Within', RelativeTolerance(1e-6)))
                end
            end
        end


        function test_anova3tworm(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names  = {'NYUHiringExperience', 'Southampton3tworm'};
            atols  = [0.3  0.01];
            for i = 1:numel(names)
                rng(0);
                cmd  = sprintf('spm1d.data.uv0d.anova3tworm.%s();', names{i});
                data = eval(cmd);
                spms = spm1d.stats.nonparam.anova3tworm(data.Y, data.A, data.B, data.C, data.SUBJ).inference(0.05, 'iterations', 1000);
                expected  = load(   fullfile(spm1d.path, 'results', 'nonparam0d', sprintf('%s.mat',names{i}) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                for ii = 1:numel(spms)
                    verifyThat(testCase, spms(ii), IsEqualTo(expected.spm(ii), 'Using',comps,'Within', RelativeTolerance(1e-6)))
                end
            end
        end




    end
end


