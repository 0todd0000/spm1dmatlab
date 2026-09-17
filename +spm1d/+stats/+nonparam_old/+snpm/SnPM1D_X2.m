%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky



classdef SnPM1D_X2 < spm1d.stats.nonparam_old.snpm.ASnPM1D
    methods
        function [self] = SnPM1D_X2(z, perm, varargin)
            self@spm1d.stats.nonparam_old.snpm.ASnPM1D(z, perm, varargin{:})
            self.STAT = 'X2';
        end

    end
end