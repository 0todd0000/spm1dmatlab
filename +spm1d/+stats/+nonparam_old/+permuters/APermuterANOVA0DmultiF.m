%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef APermuterANOVA0DmultiF < spm1d.stats.nonparam_old.permuters.APermuterANOVA & spm1d.stats.nonparam_old.permuters.APermuter0D
    methods
        function [self] = APermuterANOVA0DmultiF(y, varargin)
            self@spm1d.stats.nonparam_old.permuters.APermuterANOVA(y, varargin{:})
        end
        
        function [pp] = get_p_value_list(self, zz, zzstar, alpha)
            n   = numel(zz);
            pp  = zeros(1, n);
            for i = 1:n
                pp(i)  = self.get_p_value(zz(i), zzstar(i), alpha, 'Z', self.Z(:,i));
            end
        end

        function [z] = get_z_critical_list(self, alpha)
            z = self.get_z_critical(alpha);
        end
        
        
        
    end
end



