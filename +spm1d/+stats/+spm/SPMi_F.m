%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky




classdef SPMi_F < spm1d.stats.spm.SPMi
    properties
        effect
    end
    
    methods
        function [self] = SPMi_F(spm, alpha, zstar, p_set, p, two_tailed, clusters)
            self @ spm1d.stats.spm.SPMi(spm, alpha, zstar, p_set, p, two_tailed, clusters)
            self.effect = spm.effect;
        end
    end
    
    
    
    
    methods (Access = protected)
        
        
        function plist = get_property_list(self)
            A        = struct;
            A.effect = self.effect;
            B        = get_property_list @ spm1d.stats.spm.SPMi(self);
            AB       = [fieldnames(A)' fieldnames(B)'; struct2cell(A)' struct2cell(B)'];
            plist    = struct( AB{:} );
        end

   end


end