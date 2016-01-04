%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0DF.m 1 2016-01-04 16:07 todd $


classdef SPM0DF < matlab.mixin.CustomDisplay & spm1d.stats.spm.SPM0D
    properties
        SS
        MS
    end
    methods
        function [self] = SPM0DF(z, df, SS, MS)
            self@spm1d.stats.spm.SPM0D('F', z, df)
            self.SS       = SS;
            self.MS       = MS;
       end
    end
    methods (Access = protected)
        function propgrp = getPropertyGroups(self)
            propList = struct(...
                'SS', self.SS,...
                'df', self.df,...
                'MS', self.MS,...
                'z', self.z);
         propgrp = matlab.mixin.util.PropertyGroup(propList);
        end
   end
end