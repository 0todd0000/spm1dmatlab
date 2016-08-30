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
       
       
       function [varargout] = plot(self, varargin)
           plotter   = spm1d.plot.Plotter(varargin{:});
           h         = plotter.plot_spm(self);
           varargout = {h};
       end

    end
    

 
    methods (Access = protected)
        function header = getHeader(self)
            s = self.STAT;
            if s == 'T'
                s = 't';
            end
            header = sprintf('\nSnPM{%s} inference (1D)',s);
        end
        
        function propgrp = getPropertyGroups(self)
            plist = struct;
            plist.z           = self.z;
            plist.nPermUnique = self.nPermUnique;
            propgrp = matlab.mixin.util.PropertyGroup(plist);
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
            if two_tailed
                clusters  = self.reorder_clusters(clusters);
            end
        end
        
        function [clusters] = cluster_inference(self, clusters, two_tailed)
            for i = 1:numel(clusters)
                clusters{i} = clusters{i}.inference(self.permuter.Z2, two_tailed);
            end
        end
        
        function [clusters] = reorder_clusters(self, clusters);
            n = numel(clusters);
            if n > 0
                x = zeros(1, n);
                for i = 1:n
                    if iscell(clusters{i}.xy)
                        x(i) = clusters{i}.xy{1}(1);
                    else
                        x(i) = clusters{i}.xy(1);
                    end
                end
                [~,ind]      = sort(x);
                clusters     = clusters(ind);
            end
        end



   end



end