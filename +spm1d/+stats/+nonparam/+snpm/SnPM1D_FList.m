%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


% matlab.mixin.CustomDisplay
classdef SnPM1D_FList < spm1d.stats.nonparam.snpm.ASnPMFList

    methods
        function [self] = SnPM1D_FList(SnPMs, perm, varargin)
            self @ spm1d.stats.nonparam.snpm.ASnPMFList(SnPMs, perm, varargin)
            self.dim  = 1;
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
             % pp     = self.permuter.get_p_value_list( zz, zzstar, alpha );
             return an SnPM inference list object:
             SnPMs  = cell(1, self.nEffects);
             for i = 1:self.nEffects
                 snpm      = spm1d.stats.nonparam.snpm.SnPM1D_F(zz(i,:), self.permuter);
                 % SnPMs{i}  = spm1d.stats.nonparam.snpm.SnPM1DiF(snpm, alpha, zzstar(i), false, clusters);
             end
             
             % snpmilist = spm1d.stats.nonparam.snpm.ASnPMFiList(SnPMs, self.permuter);
             % snpmilist = spm1d.stats.anova.set_labels(snpmilist, self.permuter.calc.design);
     
             snpmilist = nan;
         end
         
         
         function [z] = get_test_stats(self)
             % f = self.SnPMS{1};
             Q = self.permuter.Q;
             z = zeros(self.nEffects, Q);
             for i = 1:self.nEffects
                 z(i,:) = self.SPMs{i}.z;
             end
         end
        
    end


end