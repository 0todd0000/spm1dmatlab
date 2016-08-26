%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef (Abstract) AbstractSNPM < matlab.mixin.CustomDisplay
    properties
        STAT
        dim
        z
        permuter
        nPermUnique
    end
    properties (Hidden)
        isanova      = false;
        isinlist     = false;
        isparametric = false;
    end
    
    
    methods
        function [self] = AbstractSNPM(z, perm, varargin)
            %parse varargin
            parser = inputParser;
            addOptional(parser, 'isinlist',   false, @islogical);
            parser.parse(varargin{:});
            isinlist         = parser.Results.isinlist;
            %set number of unique permutations
            if isinlist
                nPermUnique  = nan;
            else
                nPermUnique  = perm.nPermTotal;
            end
            %set attributes:
            self.z           = z;
            self.permuter    = perm;
            self.nPermUnique = nPermUnique;
            self.isinlist    = isinlist;
       end
       
%        function spmi = inference(self, alpha, varargin)
%             spmi = -1;
%        end
       
       
    end
    

 
%     methods (Access = protected)
%         function header = getHeader(self)
%             s = self.STAT;
%             if s == 'T'
%                 s = 't';
%             end
%             header = sprintf('\nSnPM{%s} (0D)',s);
%         end
%         
%         function propgrp = getPropertyGroups(self)
%             propList = struct;
%             propList.z           = self.z;
%             propList.nPermUnique = self.nPermUnique;
%             propgrp = matlab.mixin.util.PropertyGroup(propList);
%         end
%    end
              
   
    
end