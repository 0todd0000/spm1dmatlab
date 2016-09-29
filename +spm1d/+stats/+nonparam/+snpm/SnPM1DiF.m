%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef SnPM1DiF < spm1d.stats.nonparam.snpm.SnPM1Di
    properties
        effect = 'Main A';
    end
    
    
    methods
        function [self] = SnPM1DiF(snpm, alpha, zstar, clusters)
            two_tailed = false;
            self @ spm1d.stats.nonparam.snpm.SnPM1Di(snpm, alpha, zstar, two_tailed, clusters)
        end

    end
    


    methods (Access = protected)
   
        function propgrp = getPropertyGroups(self)
            plist = struct;
            plist.effect      = self.effect;
            plist.z           = self.z;
            plist.nPermUnique = self.nPermUnique;
            plist.nPermActual = self.nPermActual;
            plist.alpha       = self.alpha;
            plist.zstar       = self.zstar;
            plist.h0reject    = self.h0reject;
            plist.p           = self.p;
            propgrp = matlab.mixin.util.PropertyGroup(plist);
        end
   
   end



end