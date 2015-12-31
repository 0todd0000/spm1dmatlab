%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: Cluster.m 1 2016-01-04 16:07 todd $


classdef Cluster < matlab.mixin.CustomDisplay
    properties
        endpoints   %starting and ending points (interpolated to threshold)
        extent      %breadth (units: nodes)
        extentR     %breadth (units: resels)
        h           %minimum height above threshold (usually zstar)
        xy          %centroid
        P           %probability value (based on random field theory)
    end
    
    properties (Hidden)
        X           %nodes
        Z           %height profile
        u           %threshold
        isinterp    %true if the cluster endpoints are interpolated to a threhsold
        iswrapped   %not yet implemented
    end
    
    methods
        
        function [self] = Cluster(X, Z, u, isinterp)
            self.X          = X;
            self.Z          = Z;
            self.u          = u;
            self.isinterp   = isinterp;
            self            = self.assemble();
        end
       
        function self = inference(self, STAT, df, fwhm, resels, two_tailed, withBonf, nNodes)
            self.extentR  = self.extent / fwhm;
            [k,u]         = deal(self.extentR, self.h); %#ok<*PROPLC>
            switch STAT
                case 'T'
                    p = spm1d.rft1d.t.p_cluster_resels(k, abs(u), df(2), resels, 'withBonf',withBonf, 'nNodes',nNodes);
                    if two_tailed
                        p = min(1, 2*p);
                    end
                case 'X2'
                    p = spm1d.rft1d.chi2.p_cluster_resels(k, u, df(2), resels, 'withBonf',withBonf, 'nNodes',nNodes);
                case 'F'
                    p = spm1d.rft1d.f.p_cluster_resels(k, u, df, resels, 'withBonf',withBonf, 'nNodes',nNodes);
                case 'T2'
                    p = spm1d.rft1d.T2.p_cluster_resels(k, u, df, resels, 'withBonf',withBonf, 'nNodes',nNodes);
            end
            self.P    = p;
        end
       
        function h = plot_patch(self)
            [x,z,u]  = deal(self.X, self.Z, self.u); %#ok<*PROP>
            if z(1) ~= u
                x  = [x(1) x];
                z  = [u z];
            end
            if z(end) ~= u
                x  = [x x(end)];
                z  = [z u];
            end
            h = patch(x, z, 0.7*[1,1,1]);
        end
       
       
    end  %public methods
   
    
 
    methods (Access = protected)
        function self = assemble(self)
            if self.isinterp
                self.endpoints  = [self.X(1) self.X(end)];
            else
                self.endpoints  = [ceil(self.X(1)) floor(self.X(end))];
            end
            self.extent         = diff(self.endpoints);
            if self.extent ==0  %to reproduce results from previous versions, minimum extent must be one (when not interpolated)
                self.extent = 1;
            end
            self.h          = min(self.Z);
            self.xy         = [mean(self.X) mean(self.Z)];
        end

     
   end
            
    
end



