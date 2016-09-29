%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef (Abstract) ASnPM < matlab.mixin.CustomDisplay
    properties
        STAT
        Q            = 1;
        dim
        z
        permuter
        nPermUnique
        residuals
    end
    properties (Hidden)
        isanova      = false;
        isinlist     = false;
        isparametric = false;
        df           = nan;
        fwhm         = nan;
        resels       = nan;
    end
    
    
    methods
        function [self] = ASnPM(z, perm, varargin)
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
       
       
    end
    
    
    methods (Access = protected)
        
        function header = getHeader(self)
            s = self.STAT;
            if s == 'T'
                s = 't';
            end
            header = sprintf('\nSnPM{%s} (%dD)', s, self.dim);
        end
        
   end


    
end