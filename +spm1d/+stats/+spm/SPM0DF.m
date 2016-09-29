%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef SPM0DF < matlab.mixin.CustomDisplay & spm1d.stats.spm.SPM0D
    properties
        SS
        MS
        effect       = 'Main A';
    end
    methods
        function [self] = SPM0DF(z, df, SS, MS, residuals)
            self@spm1d.stats.spm.SPM0D('F', z, df, residuals)
            self.SS       = SS;
            self.MS       = MS;
       end
    end
    methods (Access = protected)
        function propgrp = getPropertyGroups(self)
            propList = struct;
            propList.effect = self.effect;
            propList.SS     = self.SS;
            propList.df     = self.df;
            propList.MS     = self.MS;
            propList.z      = self.z;
            propgrp         = matlab.mixin.util.PropertyGroup(propList);
        end
   end
end