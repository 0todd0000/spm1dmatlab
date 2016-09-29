%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef (Abstract) APermuter
    properties
        Q = 1;                %number of field nodes (Q=1 if 0D data)
        Y                     %original responses
        Z                     %primary permutation PDF
        calc                  %test statistic calulator
        dim                   %data dimensionality (0 or 1)
        ismultivariate = 0;   %multivariate flag
        labels0               %original response labels
        nPermTotal            %total number of possible permutations
        nPermActual           %actual number of permutations performed
        minp = 0;             %minimum possible p value
        maxp = 1;             %maximum possible p value
        nEffects = 1;         %number of test statistics (1 except for two- and three-way ANOVA/MANOVA)
    end
    
    methods(Abstract)
        [z] = get_test_stat(self, labels)
    end
    
    
    methods
        
        function [z] = get_test_stat_original(self)
            z = self.get_test_stat( self.labels0 );
        end
        
        function [zstar] = get_z_critical(self, alpha, varargin)
            %parse varargin
            parser      = inputParser;
            addOptional(parser, 'two_tailed', false, @islogical);
            parser.parse(varargin{:});
            two_tailed  = parser.Results.two_tailed;
            %compute critical threshold
            if two_tailed
                perc    = [100*0.5*alpha   100*(1 - 0.5*alpha)];
            else
                perc    = 100*(1 - alpha);
            end
            zstar       = spm1d.util.percentile(self.Z, perc);
        end



        function [] = check_iterations(self, alpha, iterations, force_iterations)
            N = self.nPermTotal;
            
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
    
    
    end
    
    
end



