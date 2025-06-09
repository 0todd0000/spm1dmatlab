%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef SnPM1D_T2 < spm1d.stats.nonparam_old.snpm.ASnPM1D
    methods
        function [self] = SnPM1D_T2(z, perm, varargin)
            self@spm1d.stats.nonparam_old.snpm.ASnPM1D(z, perm, varargin{:})
            self.STAT = 'T2';
        end
    end  
end