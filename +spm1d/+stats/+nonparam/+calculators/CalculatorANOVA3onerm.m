%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef CalculatorANOVA3onerm < spm1d.stats.nonparam.calculators.ACalculatorANOVAmultiF
    methods
        function [self] = CalculatorANOVA3onerm(A, B, C, SUBJ)
            self.design   = spm1d.stats.anova.designs.ANOVA3onerm(A, B, C, SUBJ);
        end
    end
end



