%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef SnPM1Di < spm1d.stats.nonparam.snpm.ASnPM1D
    properties
        PDF0
        PDF1
        alpha
        zstar
        clusters
        nClusters
        nPermActual
        two_tailed
        h0reject
        nNodes
        p
    end
    
    
    
    methods
        function [self] = SnPM1Di(snpm, alpha, zstar, two_tailed, clusters)
            self @ spm1d.stats.nonparam.snpm.ASnPM1D(snpm.z, snpm.permuter)
            self.STAT        = snpm.STAT;
            self.alpha       = alpha;
            self.zstar       = zstar;
            self.clusters    = clusters;
            self.nClusters   = numel(clusters);
            self.nPermActual = numel( self.permuter.Z );
            self.PDF0        = snpm.permuter.Z;
            self.PDF1        = snpm.permuter.Z2;
            self.two_tailed  = two_tailed;
            self.h0reject    = self.nClusters > 0;
            self.nNodes      = numel( self.z );
            self.p           = self.get_p_values();
        end
        
        
        function [p] = get_p_values(self)
            p = zeros(1, self.nClusters);
            for i = 1:self.nClusters
                p(i) = self.clusters{i}.P;
            end
        end


        function [varargout] = plot(self, varargin)
            plotter = spm1d.plot.Plotter(varargin{:});
            [h0,h1,h2,h3] = plotter.plot_spmi(self);
            varargout     = {[h0,h1,h2,h3]};
        end
        
        
        function [varargout] = plot_p_values(self, varargin)
            plotter   = spm1d.plot.Plotter(varargin{:});
            varargout = plotter.plot_p_values(self, varargin{:});
        end
        
        
        function [h] = plot_threshold_label(self, varargin)
            plotter = spm1d.plot.Plotter(varargin{:});
            h       = plotter.plot_threshold_label(self, varargin{:});
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
            plist.nPermActual = self.nPermActual;
            plist.alpha       = self.alpha;
            plist.zstar       = self.zstar;
            plist.h0reject    = self.h0reject;
            plist.p           = self.p;
            propgrp = matlab.mixin.util.PropertyGroup(plist);
        end
        


   end



end