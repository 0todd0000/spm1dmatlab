%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CalculatorANOVA2nested < spm1d.stats.nonparam.calculators.ACalculatorANOVAmultiF
    methods
        function [self] = CalculatorANOVA2nested(A, B)
            self.design   = spm1d.stats.anova.designs.ANOVA2nested(A, B);
        end
    end
end



