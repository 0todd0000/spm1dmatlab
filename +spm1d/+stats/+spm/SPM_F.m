%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef SPM_F < spm1d.stats.spm.SPM
    properties
        X
        effect  = 'Main A';
        effect_short
    end
    
    methods
        
        function [self] = SPM_F(z, df, fwhm, resels, X, beta, eij, roi)
            self @ spm1d.stats.spm.SPM('F', z, df, fwhm, resels, 'beta',beta, 'residuals',eij, 'roi',roi)
            self.X         = X;
       end
       
       
    end
   
    

 
    methods (Access = protected)
        function propgrp = getPropertyGroups(self)
            plist = struct;
            plist.effect = self.effect;
            plist.z      = self.z;
            plist.df     = self.df;
            plist.fwhm   = self.fwhm;
            plist.resels = self.resels;
            propgrp      = matlab.mixin.util.PropertyGroup(plist);
        end
        
   end


end





