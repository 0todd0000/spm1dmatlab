%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef SnPM0D_X2 < spm1d.stats.nonparam.snpm.ASnPM0D
    methods
        function [self] = SnPM0D_X2(z, perm, varargin)
            self@spm1d.stats.nonparam.snpm.ASnPM0D(z, perm, varargin{:})
            self.STAT = 'X2';
        end
    end
end