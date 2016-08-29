%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef CalculatorANOVA2rm < spm1d.stats.nonparam.calculators.ACalculatorANOVAmultiF
    methods
        function [self] = CalculatorANOVA2rm(A, B, SUBJ)
            self.design   = spm1d.stats.anova.designs.ANOVA2rm(A, B, SUBJ);
        end
    end
end



