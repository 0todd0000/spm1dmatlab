%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: Cluster.m 1 2016-01-04 16:07 todd $


classdef Cluster < matlab.mixin.CustomDisplay
    properties
        endpoints   %starting and ending points (interpolated to threshold)
        csign       %cluster sign (+1: above +u, -1: below -u)
        iswrapped   %true if the cluster wraps around the origin of a circular field
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
        isparam = true;
        other       %a merged cluster
    end
    
%     properties (Access = private)
%         other       %a merged cluster
%     end
    
    
    
    methods
        
        function [self] = Cluster(X, Z, u, isinterp)
            self.X          = X;
            self.Z          = Z;
            self.u          = u;
            self.csign      = sign(u);
            self.isinterp   = isinterp;
            self.iswrapped  = false;
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
            if self.iswrapped
                h = self.plot_patch_wrapped();
                return
            end
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
        
        function self = merge(self, other)
            self.iswrapped = true;
            self.extent    = self.extent + other.extent;
            self.extentR   = self.extentR + other.extentR;
            self.endpoints = {other.endpoints self.endpoints};
            self.h         = min(self.h, other.h);
            self.xy        = {other.xy self.xy};
            self.other     = other;
        end


       
    end  %public methods
   
    
 
    methods (Access = protected)
        function self = assemble(self)
            z = self.Z;
            if self.isinterp
                self.endpoints  = [self.X(1) self.X(end)];
            else
                self.endpoints  = [ceil(self.X(1)) floor(self.X(end))];
                z               = z(2:end-1);
            end
            self.extent         = diff(self.endpoints);
            if self.extent ==0  %to reproduce results from previous versions, minimum extent must be one (when not interpolated)
                self.extent = 1;
            end
            if self.csign == -1
                self.h      = max(z);
            elseif self.csign == 1
                self.h      = min(z);
            end
            self.xy         = [mean(self.X) mean(self.Z)];
        end
        
        
        function h = plot_patch_wrapped(self)
            self.iswrapped = false;
            h0 = self.plot_patch();
            self.iswrapped = true;
            h1 = self.other.plot_patch();
            h  = [h0 h1];
        end

     
   end
            
    
end



