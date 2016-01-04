%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0DFi.m 1 2016-01-04 16:07 todd $



classdef SPM0DFi < matlab.mixin.CustomDisplay & spm1d.stats.spm.SPM0Di
    properties
        SS
        MS
    end
    methods
        function [self] = SPM0DFi(spm, alpha, zstar, p, two_tailed)
            self@spm1d.stats.spm.SPM0Di(spm, alpha, zstar, p, two_tailed)
            self.SS           = spm.SS;
            self.MS           = spm.MS;
       end
    end
    
    methods (Access = protected)
        function propgrp = getPropertyGroups(self)
            propList = struct(...
                'SS', self.SS,...
                'df', self.df,...
                'MS', self.MS,...
                'z', self.z,...
                'alpha', self.alpha,...
                'zstar', self.zstar,...
                'h0reject', self.h0reject,...
                'p', self.p);
         propgrp = matlab.mixin.util.PropertyGroup(propList);
        end
   end
        

 
          
   
    
end