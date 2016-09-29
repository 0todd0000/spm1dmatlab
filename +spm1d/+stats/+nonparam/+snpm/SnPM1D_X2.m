%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef SnPM1D_X2 < spm1d.stats.nonparam.snpm.ASnPM1D
    methods
        function [self] = SnPM1D_X2(z, perm, varargin)
            self@spm1d.stats.nonparam.snpm.ASnPM1D(z, perm, varargin{:})
            self.STAT = 'X2';
        end

    end
end