%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef APermuterANOVA1DmultiF < spm1d.stats.nonparam.permuters.APermuterANOVA & spm1d.stats.nonparam.permuters.APermuter1D
    methods
        function [self] = APermuterANOVA1DmultiF(y, varargin)
            self@spm1d.stats.nonparam.permuters.APermuterANOVA(y, varargin{:})
        end
        
        function [self] = build_secondary_pdfs(self, zzstar, circular)
            [nIterations,~,nEffects]  = size(self.ZZ);
            Z2  = zeros(nIterations,nEffects);
            for i = 1:nEffects
                for ii = 1:nIterations
                    Z2(ii,i) = self.metric.get_max_metric( self.ZZ(ii,:,i), zzstar(i), circular );
                end
            end
            self.Z2  = Z2;
        end
        
        function [z] = get_z_critical_list(self, alpha)
            z = self.get_z_critical(alpha);
        end
        
        
        
    end
end



