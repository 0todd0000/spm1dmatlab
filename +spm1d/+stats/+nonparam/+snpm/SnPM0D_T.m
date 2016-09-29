%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef SnPM0D_T < spm1d.stats.nonparam.snpm.ASnPM0D
    methods
        function [self] = SnPM0D_T(z, perm, varargin)
            self@spm1d.stats.nonparam.snpm.ASnPM0D(z, perm, varargin{:})
            self.STAT = 'T';
        end
        
        function snpmi = inference(self, alpha, varargin)
            %parse varargin
            parser           = inputParser;
            addOptional(parser, 'two_tailed',         true, @islogical);
            addOptional(parser, 'iterations',           -1, @isscalar);
            addOptional(parser, 'force_iterations',  false, @islogical);
            parser.parse(varargin{:});
            two_tailed       = parser.Results.two_tailed;
            iterations       = parser.Results.iterations;
            force_iterations = parser.Results.force_iterations;
            % self.check_iterations(alpha, iterations, force_iterations)
            self.permuter.check_iterations(alpha, iterations, force_iterations)
            %build PDF:
            if two_tailed
                alpha0       = 0.5 * alpha;
            else
                alpha0       = alpha;
            end
            self.permuter    = self.permuter.build_pdf(iterations);
            %compute critical threshold and probability value
            zstar            = self.permuter.get_z_critical(alpha0, two_tailed);
            p                = self.permuter.get_p_value( self.z, zstar, alpha );
            snpmi            = spm1d.stats.nonparam.snpm.SnPM0Dinference(self, alpha, zstar, p, two_tailed);
        end
       
       
       
    end
   
    
end