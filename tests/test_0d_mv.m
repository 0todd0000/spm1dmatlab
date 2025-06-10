classdef test_0d_mv < matlab.unittest.TestCase
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
    
        function test_cca(testCase)
            names  = {'FitnessClub', 'StackExchange'};
            atols  = [0.001, 0.001];
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.mv0d.cca.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.cca(data.Y, data.x).inference(0.05);
                testCase.verifyEqual(spm.z, data.z, AbsTol=atols(i));
                testCase.verifyEqual(spm.df, data.df, AbsTol=0.001);
                verifyPvalue(testCase, spm.p, data.p, 0.001)
            end
        end
        
        
        function test_hotellings1(testCase)
            names  = {'RSXLHotellings1', 'Sweat'};
            atols  = [0.001, 0.01];
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.mv0d.hotellings1.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.hotellings(data.Y, data.mu).inference(0.05);
                testCase.verifyEqual(spm.z, data.z, AbsTol=atols(i));
                testCase.verifyEqual(spm.df, data.df, AbsTol=0.001);
                verifyPvalue(testCase, spm.p, data.p, 0.001)
            end
        end

        function test_hotellings_paired(testCase)
            names  = {'NCSSBeforeAfter', 'RSXLHotellingsPaired'};
            atols  = [0.001, 0.001];
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.mv0d.hotellings_paired.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.hotellings_paired(data.YA, data.YB).inference(0.05);
                testCase.verifyEqual(spm.z, data.z, AbsTol=atols(i));
                testCase.verifyEqual(spm.df, data.df, AbsTol=0.001);
                verifyPvalue(testCase, spm.p, data.p, 0.001)
            end
        end


        function test_hotellings2(testCase)
            names  = {'HELPHomeless', 'RSXLHotellings2'};
            atols  = [0.001, 0.001];
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.mv0d.hotellings2.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.hotellings2(data.YA, data.YB).inference(0.05);
                testCase.verifyEqual(spm.z, data.z, AbsTol=atols(i));
                testCase.verifyEqual(spm.df, data.df, AbsTol=0.001);
                verifyPvalue(testCase, spm.p, data.p, 0.001)
            end
        end
        
        
        function test_manova1(testCase)
            names  = {'AnimalDepression', 'Stevens2002'};
            atols  = [0.001, 0.001];
            for i = 1:numel(names)
                cmd  = sprintf('spm1d.data.mv0d.manova1.%s();', names{i});
                data = eval(cmd);
                spm  = spm1d.stats.manova1(data.Y, data.A).inference(0.05);
                testCase.verifyEqual(spm.z, data.z, AbsTol=atols(i));
                testCase.verifyEqual(spm.df, data.df, AbsTol=0.001);
                verifyPvalue(testCase, spm.p, data.p, 0.001)
            end
        end

    end
end


