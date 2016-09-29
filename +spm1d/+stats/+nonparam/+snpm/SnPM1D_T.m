%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef SnPM1D_T < spm1d.stats.nonparam.snpm.ASnPM1D
    methods
        function [self] = SnPM1D_T(z, perm, varargin)
            self@spm1d.stats.nonparam.snpm.ASnPM1D(z, perm, varargin{:})
            self.STAT = 'T';
        end
    end
end