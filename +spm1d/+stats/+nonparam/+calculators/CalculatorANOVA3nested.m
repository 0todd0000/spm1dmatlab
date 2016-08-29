%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef CalculatorANOVA3nested < spm1d.stats.nonparam.calculators.ACalculatorANOVAmultiF
    methods
        function [self] = CalculatorANOVA3nested(A, B, C)
            self.design   = spm1d.stats.anova.designs.ANOVA3nested(A, B, C);
        end
    end
end



