%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef SnPM0Dinference_F < spm1d.stats.nonparam.snpm.SnPM0Dinference
    properties
        effect
    end
    
    
    methods

        function [self] = SnPM0Dinference_F(snpm, alpha, zstar, p, varargin)
            self @ spm1d.stats.nonparam.snpm.SnPM0Dinference(snpm, alpha, zstar, p, varargin{:});
            self.effect   = snpm.effect;
        end
       
    end


end