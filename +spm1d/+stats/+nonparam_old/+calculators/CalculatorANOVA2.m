%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky



classdef CalculatorANOVA2 < spm1d.stats.nonparam_old.calculators.ACalculatorANOVAmultiF
    methods
        function [self] = CalculatorANOVA2(A, B)
            self.design   = spm1d.stats.anova.designs.ANOVA2(A, B);
        end
    end
end



