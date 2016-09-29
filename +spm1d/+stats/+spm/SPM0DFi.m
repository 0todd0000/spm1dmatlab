%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky




classdef SPM0DFi < matlab.mixin.CustomDisplay & spm1d.stats.spm.SPM0Di
    properties
        SS
        MS
        effect       = 'Main A';
    end
    methods
        function [self] = SPM0DFi(spm, alpha, zstar, p, two_tailed)
            self@spm1d.stats.spm.SPM0Di(spm, alpha, zstar, p, two_tailed)
            self.SS           = spm.SS;
            self.MS           = spm.MS;
            self.effect       = spm.effect;
       end
    end
    
    methods (Access = protected)
        function propgrp = getPropertyGroups(self)
            props          = struct;
            props.effect   = self.effect;
            props.SS       = self.SS;
            props.df       = self.df;
            props.MS       = self.MS;
            props.z        = self.z;
            props.alpha    = self.alpha;
            props.zstar    = self.zstar;
            props.h0reject = self.h0reject;
            props.p        = self.p;
            propgrp        = matlab.mixin.util.PropertyGroup(props);
        end
   end
end