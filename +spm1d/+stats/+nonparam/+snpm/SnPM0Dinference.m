%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef SnPM0Dinference < spm1d.stats.nonparam.snpm.ASnPM0D
    properties
        PDF
        alpha
        nPermActual
        two_tailed   = false;
        zstar
        h0reject
        p
    end
    
    
    methods
        function [self] = SnPM0Dinference(snpm, alpha, zstar, p, varargin)
            %parse varargin
            parser = inputParser;
            addOptional(parser, 'two_tailed', false, @islogical);
            addOptional(parser, 'isinlist',   false, @islogical);
            parser.parse(varargin{:});
            two_tailed       = parser.Results.two_tailed;
            isinlist         = parser.Results.isinlist;
            self@spm1d.stats.nonparam.snpm.ASnPM0D(snpm.z, snpm.permuter, isinlist)
            %set attributes:
            self.STAT        = snpm.STAT;
            self.PDF         = snpm.permuter.Z;
            self.nPermActual = numel( self.permuter.Z );
            self.alpha       = alpha;
            self.two_tailed  = two_tailed;
            self.zstar       = zstar;
            self.p           = p;
            self.h0reject    = self.check_null();
            self.isanova     = snpm.isanova;
       end
       
       
       
    end
    

 
    methods (Access = protected)
        function [h0reject] = check_null(self)
            if self.two_tailed
                [zc0,zc1]   = deal(self.zstar(1), self.zstar(2));
                h0reject    = (self.z < zc0) || (self.z > zc1);
            else
                h0reject    = self.z > self.zstar;
            end
        end
        
        
        function header = getHeader(self)
            s = self.STAT;
            if s == 'T'
                s = 't';
            end
            header = sprintf('\nSnPM{%s} inference (0D)', s);
        end
        
        function propgrp = getPropertyGroups(self)
            propList = struct;
            if self.isanova
                propList.effect  = self.effect;
            end
            propList.z           = self.z;
            propList.nPermUnique = self.nPermUnique;
            propList.nPermActual = self.nPermActual;
            propList.alpha       = self.alpha;
            propList.zstar       = self.zstar;
            propList.two_tailed  = self.two_tailed;
            propList.h0reject    = self.h0reject;
            propList.p           = self.p;
            propgrp = matlab.mixin.util.PropertyGroup(propList);
        end
   end
              
   
    
end