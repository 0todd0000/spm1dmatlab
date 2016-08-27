%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef ASnPM1D < spm1d.stats.nonparam.snpm.ASnPM
    properties
        roi
    end
    
    methods
        
        function [self] = ASnPM1D(z, perm, varargin)
            %parse varargin
            parser = inputParser;
            addOptional(parser, 'isinlist',   false, @islogical);
            parser.parse(varargin{:});
            isinlist         = parser.Results.isinlist;
            if isinlist
                nPermUnique  = -1;
            else
                nPermUnique  = perm.nPermTotal;
            end
            %set attributes:
            self.z           = z;
            self.permuter    = perm;
            self.nPermUnique = nPermUnique;
            self.isinlist    = isinlist;
       end
       
       function spmi = inference(self, alpha, varargin)
            spmi = -1;
       end
       
       
    end
    

 
    methods (Access = protected)
        function header = getHeader(self)
            s = self.STAT;
            if s == 'T'
                s = 't';
            end
            header = sprintf('\nSnPM{%s} (0D)',s);
        end
        
        function propgrp = getPropertyGroups(self)
            propList = struct;
            propList.z           = self.z;
            propList.nPermUnique = self.nPermUnique;
            propgrp = matlab.mixin.util.PropertyGroup(propList);
        end
   end
              
   
    
end