%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef CalculatorTtest2 < spm1d.stats.nonparam_old.calculators.ACalculatorTwoSample
    properties
        sqrtAB
    end
    
    methods
        function [self] = CalculatorTtest2(JA, JB)
            self@spm1d.stats.nonparam_old.calculators.ACalculatorTwoSample(JA, JB);
            self.sqrtAB = (1/JA + 1/JB) ^ 0.5;
        end
        
        function [z] = get_test_stat(self, yA, yB)
            [mA,mB]  = deal( mean(yA,1), mean(yB,1) );
            [sA,sB]  = deal( std(yA,0,1), std(yB,0,1) );
            s        = ((self.JA1*sA.*sA + self.JB1*sB.*sB) / self.df) .^ 0.5;
            z        = (mA - mB) ./ s / self.sqrtAB;
        end
        
    end
end



