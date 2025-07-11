%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef SnPM0D_T2 < spm1d.stats.nonparam_old.snpm.ASnPM0D
    methods
        function [self] = SnPM0D_T2(z, perm, varargin)
            self@spm1d.stats.nonparam_old.snpm.ASnPM0D(z, perm, varargin{:})
            self.STAT = 'T2';
        end
    end
end