%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef CI0D < spm1d.stats.ci.CIbase
    methods
        function [self] = CI0D(spmi)
            self@spm1d.stats.ci.CIbase(spmi)
            self.name      = '0D Confidence Interval';
            self.dim       = 0;
       end
    end
end

