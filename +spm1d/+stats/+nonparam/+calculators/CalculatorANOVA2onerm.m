%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CalculatorANOVA2onerm < spm1d.stats.nonparam.calculators.ACalculatorANOVAmultiF
    methods
        function [self] = CalculatorANOVA2onerm(A, B, SUBJ)
            self.design   = spm1d.stats.anova.designs.ANOVA2onerm(A, B, SUBJ);
        end
    end
end



