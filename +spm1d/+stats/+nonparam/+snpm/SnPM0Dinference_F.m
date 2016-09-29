%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef SnPM0Dinference_F < spm1d.stats.nonparam.snpm.SnPM0Dinference
    properties
        effect
    end
    
    
    methods

        function [self] = SnPM0Dinference_F(snpm, alpha, zstar, p, varargin)
            self @ spm1d.stats.nonparam.snpm.SnPM0Dinference(snpm, alpha, zstar, p, varargin{:});
            self.effect   = snpm.effect;
        end
       
    end
    
    methods (Access = protected)
        
        function propgrp = getPropertyGroups(self)
            plist = struct;
            plist.effect      = self.effect;
            plist.dim         = self.dim;
            plist.z           = self.z;
            plist.nPermUnique = self.nPermUnique;
            plist.nPermActual = self.nPermActual;
            plist.alpha       = self.alpha;
            plist.zstar       = self.zstar;
            plist.two_tailed  = self.two_tailed;
            plist.h0reject    = self.h0reject;
            plist.p           = self.p;
            propgrp           = matlab.mixin.util.PropertyGroup(plist);
        end
        
   end


end