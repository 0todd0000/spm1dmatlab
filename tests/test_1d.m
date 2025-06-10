classdef test_1d < matlab.unittest.TestCase
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
            names  = {'Random', 'SimulatedPataky2015a', 'SimulatedPataky2015b'};
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.uv1d.t1.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.ttest(data.Y, data.mu).inference(0.05, two_tailed=false);
                % testCase.verifyEqual(spm.z, data.z, AbsTol=0.001);
                % testCase.verifyEqual(spm.df, data.df, AbsTol=0.001);
                % verifyPvalue(testCase, spm.p, data.p, 0.001)
            end
        end




    end
end


