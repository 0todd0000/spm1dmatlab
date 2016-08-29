%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef CalculatorANOVA3rm < spm1d.stats.nonparam.calculators.ACalculatorANOVAmultiF
    methods
        function [self] = CalculatorANOVA3rm(A, B, C, SUBJ)
            self.design   = spm1d.stats.anova.designs.ANOVA3rm(A, B, C, SUBJ);
        end
    end
end



