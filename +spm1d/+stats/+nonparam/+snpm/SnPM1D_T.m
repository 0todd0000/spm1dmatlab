%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef SnPM1D_T < spm1d.stats.nonparam.snpm.ASnPM1D
    methods
        function [self] = SnPM1D_T(z, perm, varargin)
            self@spm1d.stats.nonparam.snpm.ASnPM1D(z, perm, varargin{:})
            self.STAT = 'T';
        end
        
        function snpmi = inference(self, alpha, varargin)
            % parse varargin
            parser           = inputParser;
            addOptional(parser, 'two_tailed',  true, @islogical);
            addOptional(parser, 'iterations',  -1, @isscalar);
            addOptional(parser, 'force_iterations',  false, @islogical);
            addOptional(parser, 'interp',  true, @islogical);
            addOptional(parser, 'circular',  false, @islogical);
            addOptional(parser, 'cluster_metric',  'MaxClusterIntegral', @(x)ismember(x, {'MaxClusterExtent', 'MaxClusterHeight', 'MaxClusterIntegral'}));
            parser.parse(varargin{:});
            two_tailed       = parser.Results.two_tailed;
            interp           = parser.Results.interp;
            circular         = parser.Results.circular;
            iterations       = parser.Results.iterations;
            force_iterations = parser.Results.force_iterations;
            cluster_metric   = parser.Results.cluster_metric;
            self.permuter.check_iterations(alpha, iterations, force_iterations)
            % build PDF:
            self.permuter    = self.permuter.build_pdf(iterations);
            % compute critical threshold and probability value
            zstar            = self.permuter.get_z_critical(alpha);
            % build secondary PDF:
            self.permuter    = self.permuter.set_metric( cluster_metric );
            self.permuter    = self.permuter.build_secondary_pdf(zstar, circular);
            % assemble clusters:
            clusters         = self.get_clusters(zstar, two_tailed, interp, circular, iterations, cluster_metric);
            clusters         = self.cluster_inference(clusters, two_tailed);
            p     = self.permuter.get_p_value( self.z, zstar, alpha );
            %return an SnPM object:
            if self.STAT=='F'
                snpmi = spm1d.stats.nonparam.snpm.SnPM1DiF(self, alpha, zstar, two_tailed, clusters);
            else
                snpmi = spm1d.stats.nonparam.snpm.SnPM1Di(self, alpha, zstar, two_tailed, clusters);
            end
            % snpmi            = spm1d.stats.nonparam.snpm.build_snpmi(self, alpha, zstar, clusters);

            % if self.STAT=='F'
            %     snpmi = spm1d.stats.nonparam.snpm.SnPM1Dinference_F(self, alpha, zstar, clusters);
            % else
            %     snpmi = spm1d.stats.nonparam.snpm.SnPM1Dinference(self, alpha, zstar, clusters);
            % end

            % spmi = nan;
           
        end
       
       
    end
   
    
end