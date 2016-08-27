%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef (Abstract) APermuter
    properties
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
    end
end



