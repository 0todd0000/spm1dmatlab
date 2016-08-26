%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef (Abstract) Abstract0D < spm1d.stats.nonparam.snpm.AbstractSNPM
    methods
        function [self] = Abstract0D(z, perm, varargin)
            %parse varargin
            parser           = inputParser;
            addOptional(parser, 'isinlist',  false, @islogical);
            parser.parse(varargin{:});
            isinlist         = parser.Results.isinlist;
            self@spm1d.stats.nonparam.snpm.AbstractSNPM(z, perm, isinlist)
            self.dim = 0;
       end
        
       function snpmi = inference(self, alpha, varargin)
            %parse varargin
            parser           = inputParser;
            addOptional(parser, 'iterations',  -1, @isscalar);
            addOptional(parser, 'force_iterations',  false, @islogical);
            parser.parse(varargin{:});
            iterations       = parser.Results.iterations;
            force_iterations = parser.Results.force_iterations;
            %build PDF:
            self.permuter = self.permuter.build_pdf(iterations);
            %compute critical threshold and probability value
            zstar = self.permuter.get_z_critical(alpha);
            p     = self.permuter.get_p_value( self.z, zstar, alpha );
            %return an SnPM object:
            snpmi = spm1d.stats.nonparam.snpm.SnPM0Dinference(self, alpha, zstar, p);
        end
       
       
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
%               
   
    
end