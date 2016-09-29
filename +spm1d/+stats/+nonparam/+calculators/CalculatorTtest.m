%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CalculatorTtest < spm1d.stats.nonparam.calculators.ACalculatorOneSample
    properties
        sqrtJ
    end
    
    methods
        function [self] = CalculatorTtest(J, mu)
            self@spm1d.stats.nonparam.calculators.ACalculatorOneSample(J, mu)
            self.sqrtJ = self.J ^ 0.5;
        end
        
        function [z] = get_test_stat_mu_subtracted(self, y)
            z = mean(y,1) ./ std(y,0,1) * self.sqrtJ;
        end
        
    end
end



