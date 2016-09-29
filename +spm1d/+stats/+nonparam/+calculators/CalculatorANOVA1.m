%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CalculatorANOVA1 < spm1d.stats.nonparam.calculators.ACalculatorANOVAsingleF
    methods
        function [self] = CalculatorANOVA1(A)
            self.design   = spm1d.stats.anova.designs.ANOVA1(A);
        end
    end
end



