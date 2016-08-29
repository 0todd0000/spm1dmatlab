%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef ASnPM1D < spm1d.stats.nonparam.snpm.ASnPM
    properties
        roi
    end
    
    methods
        
        function [self] = ASnPM1D(z, perm, varargin)
            %parse varargin
            parser = inputParser;
            addOptional(parser, 'isinlist',   false, @islogical);
            parser.parse(varargin{:});
            isinlist         = parser.Results.isinlist;
            self@spm1d.stats.nonparam.snpm.ASnPM(z, perm, isinlist)
            if isinlist
                nPermUnique  = -1;
            else
                nPermUnique  = perm.nPermTotal;
            end
            %set attributes:
            self.dim         = 1;
            self.Q           = numel(z);
            self.z           = z;
            self.permuter    = perm;
            self.nPermUnique = nPermUnique;
            self.isinlist    = isinlist;
       end
       
       function spmi = inference(self, alpha, varargin)
           % %parse varargin
           % parser           = inputParser;
           % addOptional(parser, 'iterations',  -1, @isscalar);
           % addOptional(parser, 'force_iterations',  false, @islogical);
           % parser.parse(varargin{:});
           % iterations       = parser.Results.iterations;
           % force_iterations = parser.Results.force_iterations;
           % self.permuter.check_iterations(alpha, iterations, force_iterations)


           % %build PDF:
           % self.permuter = self.permuter.build_pdf(iterations);
           % %compute critical threshold and probability value
           % zstar = self.permuter.get_z_critical(alpha);
           % p     = self.permuter.get_p_value( self.z, zstar, alpha );
           % % %return an SnPM object:
           % % if self.STAT=='F'
           % %     snpmi = spm1d.stats.nonparam.snpm.SnPM1Dinference_F(self, alpha, zstar, p);
           % % else
           % %     snpmi = spm1d.stats.nonparam.snpm.SnPM1Dinference(self, alpha, zstar, p);
           % % end
           %
           spmi = nan;
           
       end
       
       
       function plot(self)
           plot(self.z, 'linewidth',3, 'color','k')
       end
       
       
       

       
       
       
    end
    

 
    methods (Access = protected)
        function header = getHeader(self)
            s = self.STAT;
            if s == 'T'
                s = 't';
            end
            header = sprintf('\nSnPM{%s} (1D)',s);
        end
        
        function propgrp = getPropertyGroups(self)
            propList = struct;
            propList.z           = self.z;
            propList.nPermUnique = self.nPermUnique;
            propgrp = matlab.mixin.util.PropertyGroup(propList);
        end
        
        function [clusters] = get_clusters(self, zstar, two_tailed, interp, circular, iterations, cluster_metric)
            clusters = spm1d.geom.cluster_geom(self.z, zstar, interp, circular, 'csign',+1, 'nonparam',true);
            if two_tailed
                clustersn = spm1d.geom.cluster_geom(-self.z, zstar, interp, circular, 'csign',-1, 'nonparam',true);
                clusters  = [clusters clustersn];
            end
            for i = 1:numel(clusters)
                clusters{i} = clusters{i}.set_metric(cluster_metric, iterations, self.nPermUnique, two_tailed);
            end
        end
        
        function [clusters] = cluster_inference(self, clusters, two_tailed)
            for i = 1:numel(clusters)
                clusters{i} = clusters{i}.inference(self.permuter.Z2, two_tailed);
            end
        end



   end
              
   
    
end