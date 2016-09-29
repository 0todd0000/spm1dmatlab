%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky




classdef SPMi < matlab.mixin.CustomDisplay & handle
    properties
        STAT        %test statistic ("T", "F", "X2" or "T2")
        dim = 1;    %data dimensionality
        two_tailed
        df          %degrees of freedom
        nNodes      %number of continuum nodes
        beta        %fitted model parameters (usually means or slopes)
        sigma2      %field variance
        residuals   %fitted model residuals
        z           %test statistic continuum
        fwhm        %field smoothness (full width at half maximum)
        resels      %"resolution element" counts
        alpha       %type I error rate
        zstar       %critical test statistic threshold (at alpha)
        h0reject    %null hypothesis rejected?
        p_set       %set-level inference
        p           %cluster-level inference
        nClusters   %number of supra-threshold clusters
        clusters    %cluster objects
        isparametric = true;
    end
    properties (Hidden)
        centroids
        roi
    end
    
    
    methods
        
        function [self] = SPMi(spm, alpha, zstar, p_set, p, two_tailed, clusters)
            self.STAT         = spm.STAT;
            self.df           = spm.df;
            self.beta         = spm.beta;
            self.sigma2       = spm.sigma2;
            self.residuals    = spm.residuals;
            self.z            = spm.z;
            self.nNodes       = spm.nNodes;
            self.fwhm         = spm.fwhm;
            self.resels       = spm.resels;
            self.roi          = spm.roi;
            self.alpha        = alpha;
            self.zstar        = zstar;
            self.clusters     = clusters;
            if two_tailed
                self.h0reject = max( abs(self.z) ) > self.zstar;
            else
                self.h0reject = max(self.z) > self.zstar;
            end
            self.p_set        = p_set;
            self.p            = p;
            self.two_tailed   = two_tailed;
            self.nClusters    = numel(p);
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
            header = sprintf('\nSPM{%s} inference',s);
        end

        function plist = get_property_list(self)
            plist          = struct;
            plist.z        = self.z;
            plist.df       = self.df;
            plist.fhwm     = self.fwhm;
            plist.resels   = self.resels;
            plist.alpha    = self.alpha;
            plist.zstar    = self.zstar;
            plist.h0reject = self.h0reject;
            plist.p_set    = self.p_set;
            plist.p        = self.p;
        end

        function propgrp = getPropertyGroups(self)
            plist   = self.get_property_list();
            propgrp = matlab.mixin.util.PropertyGroup(plist);
        end
        
        
        
   end


end