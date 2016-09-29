%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef SnPM1D_F < spm1d.stats.nonparam.snpm.ASnPM1D
    properties
        effect  = 'Main A';
    end
    
    
    methods
        function [self] = SnPM1D_F(z, perm, varargin)
            self @ spm1d.stats.nonparam.snpm.ASnPM1D(z, perm, varargin{:})
            self.STAT    = 'F';
            self.isanova = true;
        end
        
    end
    
    
    methods (Access = protected)
        
        function propgrp = getPropertyGroups(self)
            plist = struct;
            plist.effect      = self.effect;
            plist.dim         = self.dim;
            plist.z           = self.z;
            plist.nPermUnique = self.nPermUnique;
            propgrp           = matlab.mixin.util.PropertyGroup(plist);
        end
        
   end
    
end