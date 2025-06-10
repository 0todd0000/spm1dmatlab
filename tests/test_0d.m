classdef test_0d < matlab.unittest.TestCase
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
            names  = {'ColumbiaSalmonella', 'RSWeightReduction'};
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv0d.t1.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.ttest(data.Y, data.mu).inference(0.05, two_tailed=false);
                testCase.verifyEqual(spm.z, data.z, AbsTol=0.001);
                testCase.verifyEqual(spm.df, data.df, AbsTol=0.001);
                verifyPvalue(testCase, spm.p, data.p, 0.001)
            end
        end

        function test_ttest_paired(testCase)
            names  = {'ColumbiaMileage', 'RSWeightClinic'};
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv0d.tpaired.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.ttest_paired(data.YA, data.YB).inference(0.05, two_tailed=false);
                testCase.verifyEqual(spm.z, data.z, AbsTol=0.001);
                testCase.verifyEqual(spm.df, data.df, AbsTol=0.001);
                verifyPvalue(testCase, spm.p, data.p, 0.001)
            end
        end

        function test_ttest2(testCase)
            names  = {'ColumbiaPlacebo', 'RSFlavor'};
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv0d.t2.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.ttest2(data.YA, data.YB).inference(0.05, two_tailed=false);
                testCase.verifyEqual(spm.z, data.z, AbsTol=0.001);
                testCase.verifyEqual(spm.df, data.df, AbsTol=0.001);
                verifyPvalue(testCase, spm.p, data.p, 0.001)
            end
        end

        function test_regress(testCase)
            names  = {'ColumbiaHeadCircumference', 'RSRegression'};
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv0d.regress.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.regress(data.Y, data.x).inference(0.05, two_tailed=true);
                testCase.verifyEqual(spm.z, data.z, AbsTol=0.001);
                testCase.verifyEqual(spm.df, data.df, AbsTol=0.001);
                 verifyPvalue(testCase, spm.p, data.p, 0.001)
                testCase.verifyEqual(spm.r, data.r, AbsTol=0.001);
            end
        end

        %--------------------------------------------------
        %  confidence interval test cases
        %--------------------------------------------------

        function test_ci1(testCase)
            names  = {'MinnesotaGeyerRate', 'WebsterSleep'};
            atols  = [0.001 0.1];
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv0d.ci1.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.ci_onesample(data.Y, 0.05);
                testCase.verifyEqual(spm.ci, data.ci, AbsTol=atols(i));
            end
        end
        
        
        function test_ci_paired(testCase)
            names  = {'FraminghamSystolicBloodPressure'};
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv0d.cipaired.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.ci_pairedsample(data.YA, data.YB, 0.05);
                testCase.verifyEqual(spm.ci, data.ci, AbsTol=0.1);
            end
        end
        
        
        
        function test_ci2(testCase)
            names  = {'AnimalsInResearch'};
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv0d.ci2.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.ci_twosample(data.YA, data.YB, 0.05);
                testCase.verifyEqual(spm.ci, data.ci, AbsTol=0.01);
            end
        end
        

        %--------------------------------------------------
        %  ANOVA test cases
        %--------------------------------------------------

        function test_anova1(testCase)
            names  = {'Cars', 'ConstructionUnequalSampleSizes', 'RSUnequalSampleSizes', 'Sound', 'Southampton1'};
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv0d.anova1.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.anova1(data.Y, data.A).inference(0.05);
                testCase.verifyEqual(spm.z, data.z, AbsTol=0.01);
                testCase.verifyEqual(spm.df, data.df, AbsTol=0.001);
                verifyPvalue(testCase, spm.p, data.p, 0.001)
            end
        end


        function test_anova1rm(testCase)
            names  = {'Abdi2010', 'Groceries', 'Imacelebrity', 'Southampton1rm'};
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv0d.anova1rm.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.anova1rm(data.Y, data.A, data.SUBJ).inference(0.05);
                testCase.verifyEqual(spm.z, data.z, AbsTol=0.01);
                testCase.verifyEqual(spm.df, data.df, AbsTol=0.001);
                % testCase.verifyEqual(spm.p, data.p, AbsTol=0.001);
                verifyPvalue(testCase, spm.p, data.p, 0.001)
            end
        end


        function test_anova2(testCase)
            names  = {'Detergent', 'Mouse', 'Satisfaction', 'SouthamptonCrossed1'};
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv0d.anova2.%s();', names{i});
                data = eval(cmd);
                spms = spm1d.stats.anova2(data.Y, data.A, data.B).inference(0.05);
                n    = numel(spms);
                for ii = 1:spms.nEffects
                    spm = spms(ii);
                    testCase.verifyEqual(spm.z, data.z(ii), AbsTol=0.01);
                    testCase.verifyEqual(spm.df, data.df{ii}, AbsTol=0.001);
                    verifyPvalue(testCase, spm.p, data.p(ii), 0.001)
                end
            end
        end


        function test_anova2nested(testCase)
            names  = {'QIMacros', 'SouthamptonNested1'};
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv0d.anova2nested.%s();', names{i});
                data = eval(cmd);
                spms = spm1d.stats.anova2nested(data.Y, data.A, data.B).inference(0.05);
                n    = numel(spms);
                for ii = 1:spms.nEffects
                    spm = spms(ii);
                    testCase.verifyEqual(spm.z, data.z(ii), AbsTol=0.01);
                    testCase.verifyEqual(spm.df, data.df{ii}, AbsTol=0.001);
                    verifyPvalue(testCase, spm.p, data.p(ii), 0.001)
                end
            end
        end


        function test_anova2onerm(testCase)
            names  = {'RSXLDrug', 'Santa23', 'Santa23UnequalSampleSizes', 'Southampton2onerm', 'Southampton2onermUnequalSampleSizes'};
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv0d.anova2onerm.%s();', names{i});
                data = eval(cmd);
                spms = spm1d.stats.anova2onerm(data.Y, data.A, data.B, data.SUBJ).inference(0.05);
                n    = numel(spms);
                for ii = 1:spms.nEffects
                    spm = spms(ii);
                    testCase.verifyEqual(spm.z, data.z(ii), AbsTol=0.01);
                    testCase.verifyEqual(spm.df, data.df{ii}, AbsTol=0.001);
                    verifyPvalue(testCase, spm.p, data.p(ii), 0.001)
                end
            end
        end
        
        
        function test_anova2rm(testCase)
            names  = {'Antidepressant', 'RSXLTraining', 'SocialNetworks', 'Southampton2rm'};
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv0d.anova2rm.%s();', names{i});
                data = eval(cmd);
                spms = spm1d.stats.anova2rm(data.Y, data.A, data.B, data.SUBJ).inference(0.05);
                n    = numel(spms);
                for ii = 1:spms.nEffects
                    spm = spms(ii);
                    testCase.verifyEqual(spm.z, data.z(ii), AbsTol=0.01);
                    testCase.verifyEqual(spm.df, data.df{ii}, AbsTol=0.001);
                    verifyPvalue(testCase, spm.p, data.p(ii), 0.001)
                end
            end
        end
        
        
        function test_anova3(testCase)
            names  = {'RSItalian', 'SouthamptonFullyCrossedMixed'};
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv0d.anova3.%s();', names{i});
                data = eval(cmd);
                spms = spm1d.stats.anova3(data.Y, data.A, data.B, data.C).inference(0.05);
                n    = numel(spms);
                for ii = 1:spms.nEffects
                    spm = spms(ii);
                    testCase.verifyEqual(spm.z, data.z(ii), AbsTol=0.01);
                    testCase.verifyEqual(spm.df, data.df{ii}, AbsTol=0.001);
                    verifyPvalue(testCase, spm.p, data.p(ii), 0.001)
                end
            end
        end


        function test_anova3nested(testCase)
            names  = {'SouthamptonNested3'};
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv0d.anova3nested.%s();', names{i});
                data = eval(cmd);
                spms = spm1d.stats.anova3nested(data.Y, data.A, data.B, data.C).inference(0.05);
                n    = numel(spms);
                for ii = 1:spms.nEffects
                    spm = spms(ii);
                    testCase.verifyEqual(spm.z, data.z(ii), AbsTol=0.01);
                    testCase.verifyEqual(spm.df, data.df{ii}, AbsTol=0.001);
                    % verifyPvalue(testCase, spm.p, data.p(i), 0.001)
                end
            end
        end


        function test_anova3onerm(testCase)
            names  = {'NYUCaffeine', 'Southampton3onerm'};
            atols  = [0.4  0.1];
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv0d.anova3onerm.%s();', names{i});
                data = eval(cmd);
                spms = spm1d.stats.anova3onerm(data.Y, data.A, data.B, data.C, data.SUBJ).inference(0.05);
                n    = numel(spms);
                for ii = 1:spms.nEffects
                    spm = spms(ii);
                    testCase.verifyEqual(spm.z, data.z(ii), AbsTol=atols(i));
                    testCase.verifyEqual(spm.df, data.df{ii}, AbsTol=0.001);
                    verifyPvalue(testCase, spm.p, data.p(ii), 0.001)
                end
            end
        end


        function test_anova3rm(testCase)
            names  = {'SPM1D2x2x2', 'SPM1D2x3x5', 'SPM1D3x3x3'};
            % atols  = [0.4  0.1];
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv0d.anova3rm.%s();', names{i});
                data = eval(cmd);
                spms = spm1d.stats.anova3rm(data.Y, data.A, data.B, data.C, data.SUBJ).inference(0.05);
                n    = numel(spms);
                for ii = 1:spms.nEffects
                    spm = spms(ii);
                    testCase.verifyEqual(spm.z, data.z(ii), AbsTol=0.001);
                    testCase.verifyEqual(spm.df, data.df{ii}, AbsTol=0.001);
                    verifyPvalue(testCase, spm.p, data.p(ii), 0.001)
                end
            end
        end
        
        
        function test_anova3tworm(testCase)
            names  = {'NYUHiringExperience', 'Southampton3tworm'};
            atols  = [0.3  0.01];
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv0d.anova3tworm.%s();', names{i});
                data = eval(cmd);
                spms = spm1d.stats.anova3tworm(data.Y, data.A, data.B, data.C, data.SUBJ).inference(0.05);
                n    = numel(spms);
                for ii = 1:spms.nEffects
                    spm = spms(ii);
                    testCase.verifyEqual(spm.z, data.z(ii), AbsTol=atols(i));
                    testCase.verifyEqual(spm.df, data.df{ii}, AbsTol=0.001);
                    verifyPvalue(testCase, spm.p, data.p(ii), 0.001)
                end
            end
        end


    end
end


