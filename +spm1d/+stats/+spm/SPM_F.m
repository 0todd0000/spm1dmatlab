%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM_F.m 1 2016-01-04 16:07 todd $



classdef SPM_F < spm1d.stats.spm.SPM
    properties
        X
        X0
    end
    
    methods
        
        function [self] = SPM_F(z, df, fwhm, resels, X, beta, eij, X0)
            self@spm1d.stats.spm.SPM('F', z, df, fwhm, resels, 'beta',beta, 'residuals',eij)
            self.X        = X;
            self.X0       = X0;
            %assemble inputs:
            self.STAT     = STAT;
            self.z        = z;
            self.df       = df;
            self.fwhm     = fwhm;
            self.resels   = resels;
            self.nNodes   = numel(z);
            self.beta     = parser.Results.beta;
            self.R        = parser.Results.residuals;
            self.sigma2   = parser.Results.sigma2;

       end
       
       function spmi = inference(self, alpha, varargin)
            %parse inputs
            default2tailed = isequal(self.STAT,'T');
            parser = inputParser;
            addOptional(parser, 'two_tailed', default2tailed, @islogical);
            parser.parse(varargin{:});
            two_tailed    = parser.Results.two_tailed;
            %two-tailed check
            if two_tailed && ~isequal(self.STAT, 'T')
                error('Two-tailed inference can only be used for t tests and regression.')
            end
            %correct for two-tailed inference
            if two_tailed
                pstar = alpha/2;
            else
                pstar = alpha;
            end
            %compute critical threshold
            zstar  = self.get_critical_threshold(pstar);
            % compute supra-threshold cluster geometry:
            [extents,heights] = spm1d.geom.cluster_geom(self.z, zstar);
            if two_tailed
                [extentsn,heightsn] = spm1d.geom.cluster_geom(-self.z, zstar);
                extents = [extents extentsn];
                heights = [heights heightsn];
            end
            % compute cluster-specific p values:
            extentsR    = extents / self.fwhm;  %extents in resel units
            p           = self.get_p_values(extentsR, heights, two_tailed);
            spmi        = spm1d.stats.spm.SPMi(self, alpha, zstar, p, two_tailed);
       end
       
       function plot(self)
           plot(self.z, 'linewidth',3, 'color','k')
       end
       
       
    end
   
    
    methods (Access=private)
        

                
                
        function [zstar] = get_critical_threshold(self, alpha)
            [v,Q,w] = deal(self.df, self.nNodes, self.fwhm);
            switch self.STAT
                case 'T'
                    zstar = spm1d.rft1d.t.isf(alpha, v(2), Q, w);
                case 'X2'
                    zstar = spm1d.rft1d.chi2.isf(alpha, v(2), Q, w);
                case 'F'
                    zstar = spm1d.rft1d.f.isf(alpha, v, Q, w);
                case 'T2'
                    zstar = spm1d.rft1d.T2.isf(alpha, v, Q, w);
            end
        end
        
        
        function [p] = get_p_values(self, kk, uu, two_tailed)
            n = numel(kk);
            p = zeros(1,n);
            for i = 1:n
                p(i) = self.get_p_value(kk(i), uu(i), two_tailed);
            end
        end
        
        
        function [p] = get_p_value(self, k, u, two_tailed)
            [v,Q,w] = deal(self.df, self.nNodes, self.fwhm);
            switch self.STAT
                case 'T'
                    p = spm1d.rft1d.t.p_cluster(k, abs(u), v(2), Q, w);
                    if two_tailed
                        p = min(1, 2*p);
                    end
                case 'X2'
                    p = spm1d.rft1d.chi2.p_cluster(k, u, v(2), Q, w);
                case 'F'
                    p = spm1d.rft1d.f.p_cluster(k, u, v, Q, w);
                case 'T2'
                    p = spm1d.rft1d.T2.p_cluster(k, u, v, Q, w);
            end
        end
    end
            
 
    methods (Access = protected)
        function header = getHeader(self)
            s = self.STAT;
            if s == 'T'
                s = 't';
            end
            header = sprintf('\nSPM{%s}',s);
        end
        
        function propgrp = getPropertyGroups(self)
            propList = struct(...
                'z', self.z,...
                'df', self.df,...
                'fwhm', self.fwhm,...
                'resels', self.resels);
         propgrp = matlab.mixin.util.PropertyGroup(propList);
        end
   end
            
    
end



