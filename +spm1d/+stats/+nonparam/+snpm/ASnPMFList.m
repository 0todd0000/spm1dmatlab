%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky




classdef ASnPMFList < spm1d.stats.spm.ASPMFList
    properties
        permuter
        nPermUnique
        isinference = false;
    end


    methods
        function [self] = ASnPMFList(SnPMs, perm, varargin)
            self @ spm1d.stats.spm.ASPMFList(SnPMs)
            self.name         = 'SnPM{F} list';
            self.permuter     = perm;
            self.isparametric = false;
            self.nPermUnique  = perm.nPermTotal;
            self.Q            = SnPMs{1}.Q;
        end
        
        
        function snpmilist    = inference(self, alpha, varargin)
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
             zz     = self.get_test_stats();
             zzstar = self.permuter.get_z_critical_list(alpha);
             pp     = self.permuter.get_p_value_list( zz, zzstar, alpha );
             %return an SnPM inference list object:
             SnPMs  = cell(1, self.nEffects);
             for i = 1:self.nEffects
                 snpm      = spm1d.stats.nonparam.snpm.SnPM0D_F(zz(i), self.permuter);
                 SnPMs{i}  = spm1d.stats.nonparam.snpm.SnPM0Dinference_F(snpm, alpha, zzstar(i), pp(i));
             end
             snpmilist = spm1d.stats.nonparam.snpm.ASnPMFiList(SnPMs, self.permuter);
             snpmilist = spm1d.stats.anova.set_labels(snpmilist, self.permuter.calc.design);
         end
        
        
        
    end


end