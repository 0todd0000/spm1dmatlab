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
        function test_ttest(testCase)
            names  = {'ColumbiaSalmonella', 'RSWeightReduction'};
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv0d.t1.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.ttest(data.Y, data.mu).inference(0.05, two_tailed=false);
                testCase.verifyEqual(spm.z, data.z, AbsTol=0.001);
                testCase.verifyEqual(spm.df, data.df, AbsTol=0.001);
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
                testCase.verifyEqual(spm.p, data.p, AbsTol=0.001);
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
                testCase.verifyEqual(spm.p, data.p, AbsTol=0.001);
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
                testCase.verifyEqual(spm.p, data.p, AbsTol=0.001);
                testCase.verifyEqual(spm.r, data.r, AbsTol=0.001);
            end
        end


    end
end