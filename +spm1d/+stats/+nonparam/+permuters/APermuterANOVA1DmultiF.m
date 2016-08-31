%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef APermuterANOVA1DmultiF < spm1d.stats.nonparam.permuters.APermuterANOVA & spm1d.stats.nonparam.permuters.APermuter1D
    methods
        function [self] = APermuterANOVA1DmultiF(y, varargin)
            self@spm1d.stats.nonparam.permuters.APermuterANOVA(y, varargin{:})
        end
        
        % function [pp] = get_p_value_list(self, zz, zzstar, alpha)
        %     n   = numel(zz);
        %     pp  = cell(1, n);
        %
        %     size(zz)
        %     size(zzstar)
        %
        %     for i = 1:n
        %         pp{i}  = self.get_p_value(zz(i,:), zzstar(i), alpha, 'Z', self.Z(:,i));
        %     end
        % end

        function [z] = get_z_critical_list(self, alpha)
            z = self.get_z_critical(alpha);
        end
        
        
        
    end
end



