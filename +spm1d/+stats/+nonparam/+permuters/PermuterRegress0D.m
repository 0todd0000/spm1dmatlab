%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef PermuterRegress0D < spm1d.stats.nonparam.permuters.APermuterRegress & spm1d.stats.nonparam.permuters.APermuter0D
    methods
        function [self] = PermuterRegress0D(y, x)
            self@spm1d.stats.nonparam.permuters.APermuterRegress(y, x)
            self.calc = spm1d.stats.nonparam.calculators.CalculatorRegress(x);
        end
    end
end


