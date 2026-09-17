%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky



classdef CalculatorANOVA3nested < spm1d.stats.nonparam_old.calculators.ACalculatorANOVAmultiF
    methods
        function [self] = CalculatorANOVA3nested(A, B, C)
            self.design   = spm1d.stats.anova.designs.ANOVA3nested(A, B, C);
        end
    end
end



