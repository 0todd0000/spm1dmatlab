%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef (Abstract) ASnPM < matlab.mixin.CustomDisplay
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
       
%        function spmi = inference(self, alpha, varargin)
%             spmi = -1;
%        end
       
       
    end
    

 
    methods (Access = protected)
        function [] = check_iterations(self, alpha, iterations, force_iterations)
            N = self.nPermUnique;
            
            if iterations > N
                error( '\nNumber of specified iterations (%d) exceeds the maximum possible number of iterations (%d)\n', iterations, N)
            
            elseif (((iterations == -1) && ( N > 1e4 )) || (iterations > 1e4)) && ~force_iterations
                if iterations == -1
                    n = N;
                else
                    n = iterations;
                end
                error( '\nThe total number of iterations (%d) is very large and may cause computational problems. In the call to "inference"...\n(1) Set "iterations" to a number between 10 and 10,000, or\n(2) set "force_iterations" to "true" to enable calculations for iterations > 10,000.\nNOTE: Setting "force_iterations" to "true" may require substantial computational resources and may cause crashes. USE WITH CAUTION.\n', n)
                
            elseif (iterations ~= -1) && ( iterations < 10)
                error( '\nNumber of specified iterations (%d) must be at least 10\n', iterations)

            elseif (iterations > 0) && ( iterations < 1/alpha)
                error( '\nNumber of specified iterations (%d) must be at least %d to conduct inference at alpha=%0.5f\n', iterations, ceil(1/alpha), alpha)
            end
        end
    
    
        % function header = getHeader(self)
        %     s = self.STAT;
        %     if s == 'T'
        %         s = 't';
        %     end
        %     header = sprintf('\nSnPM{%s} (0D)',s);
        % end
        %
        % function propgrp = getPropertyGroups(self)
        %     propList = struct;
        %     propList.z           = self.z;
        %     propList.nPermUnique = self.nPermUnique;
        %     propgrp = matlab.mixin.util.PropertyGroup(propList);
        % end
   end


    
end