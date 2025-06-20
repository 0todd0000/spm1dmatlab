
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
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names  = {'Random', 'SimulatedPataky2015a', 'SimulatedPataky2015b'};
            for i = 1:numel(names)
                name      = names{i};
                data      = eval(   sprintf('spm1d.data.uv1d.t1.%s();', name)   );
                spm       = spm1d.stats.ttest(data.Y, data.mu).inference(0.05, two_tailed=false);
                expected  = load(   fullfile(spm1d.path, 'results', sprintf('%s.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                verifyThat(testCase, spm, IsEqualTo(expected.spm, 'Using',comps,'Within', RelativeTolerance(2*eps)))
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
                spm       = spm1d.stats.ttest_paired(data.YA, data.YB).inference(0.05, two_tailed=true);
                expected  = load(   fullfile(spm1d.path, 'results', sprintf('%sPaired.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                verifyThat(testCase, spm, IsEqualTo(expected.spm, 'Using',comps,'Within', RelativeTolerance(2*eps)))
            end
        end
        
        function test2(testCase)
            import matlab.unittest.constraints.IsEqualTo;
            import matlab.unittest.constraints.PublicPropertyComparator;
            import matlab.unittest.constraints.RelativeTolerance;
            names  = {'PlantarArchAngle'};
            for i = 1:numel(names)
                name      = names{i};
                data      = eval(   sprintf('spm1d.data.uv1d.tpaired.%s();', name)   );
                spm       = spm1d.stats.ttest2(data.YA, data.YB).inference(0.05, two_tailed=true);
                expected  = load(   fullfile(spm1d.path, 'results', sprintf('%s.mat',name) )   );
                comps     = [PublicPropertyComparator.supportingAllValues(), IsEqualTo([]).Comparator];
                verifyThat(testCase, spm, IsEqualTo(expected.spm, 'Using',comps,'Within', RelativeTolerance(2*eps)))
            end
        end
        

    end
end


