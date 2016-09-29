%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef (Abstract) ASnPM0D < spm1d.stats.nonparam.snpm.ASnPM
    methods
        function [self] = ASnPM0D(z, perm, varargin)
            %parse varargin
            parser           = inputParser;
            addOptional(parser, 'isinlist',  false, @islogical);
            parser.parse(varargin{:});
            isinlist         = parser.Results.isinlist;
            self@spm1d.stats.nonparam.snpm.ASnPM(z, perm, isinlist)
            self.dim = 0;
       end
        
       function snpmi = inference(self, alpha, varargin)
            %conduct inference
            %parse varargin
            parser           = inputParser;
            addOptional(parser, 'iterations',  -1, @isscalar);
            addOptional(parser, 'force_iterations',  false, @islogical);
            parser.parse(varargin{:});
            iterations       = parser.Results.iterations;
            force_iterations = parser.Results.force_iterations;
            self.permuter.check_iterations(alpha, iterations, force_iterations)
            %build PDF:
            self.permuter = self.permuter.build_pdf(iterations);
            %compute critical threshold and probability value
            zstar = self.permuter.get_z_critical(alpha);
            p     = self.permuter.get_p_value( self.z, zstar, alpha );
            %return an SnPM object:
            if self.STAT=='F'
                snpmi = spm1d.stats.nonparam.snpm.SnPM0Dinference_F(self, alpha, zstar, p);
            else
                snpmi = spm1d.stats.nonparam.snpm.SnPM0Dinference(self, alpha, zstar, p);
            end
        end
       
       
    end


end