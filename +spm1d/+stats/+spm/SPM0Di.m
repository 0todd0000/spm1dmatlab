%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0Di.m 1 2016-01-04 16:07 todd $



classdef SPM0Di < matlab.mixin.CustomDisplay
    properties
        df
        z
        alpha
        zstar
        h0reject
        p
        r
        isregress
    end
    properties (Hidden)
        STAT
        two_tailed
    end
    methods
        function [self] = SPM0Di(spm, alpha, zstar, p, two_tailed)
            self.STAT         = spm.STAT;
            self.df           = spm.df;
            self.z            = spm.z;
            self.r            = spm.r;
            self.isregress    = spm.isregress;
            self.alpha        = alpha;
            self.zstar        = zstar;
            if two_tailed
                self.h0reject = abs(self.z) > self.zstar;
            else
                self.h0reject = self.z > self.zstar;
            end
            self.p            = p;
            self.two_tailed   = two_tailed;
       end
    end
    
    methods (Access = protected)
        function header = getHeader(self)
            s = self.STAT;
            if s == 'T'
                s = 't';
            end
            header = sprintf('\nSPM{%s} (0D) inference',s);
        end
        
        function propgrp = getPropertyGroups(self)
            if self.isregress
                propList = struct(...
                    'z', self.z,...
                    'df', self.df,...
                    'r', self.r,...
                    'alpha', self.alpha,...
                    'zstar', self.zstar,...
                    'h0reject', self.h0reject,...
                    'p', self.p);
            else
            propList = struct(...
                'z', self.z,...
                'df', self.df,...
                'alpha', self.alpha,...
                'zstar', self.zstar,...
                'h0reject', self.h0reject,...
                'p', self.p);
            end
         propgrp = matlab.mixin.util.PropertyGroup(propList);
        end
   end
         
   
    
end