%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef SnPM1D_T < spm1d.stats.nonparam_old.snpm.ASnPM1D
    methods
        function [self] = SnPM1D_T(z, perm, varargin)
            self@spm1d.stats.nonparam_old.snpm.ASnPM1D(z, perm, varargin{:})
            self.STAT = 'T';
        end
    end
end