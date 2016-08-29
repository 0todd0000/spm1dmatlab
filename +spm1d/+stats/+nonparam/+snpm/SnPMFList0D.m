%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef SnPMFList0D < spm1d.stats.spm.SPMFList & spm1d.stats.nonparam.snpm.ASnPM0D
    % properties
    %     effect  = 'Main A';
    % end
    
    
    methods
        function [self] = SnPMFList0D(z, perm, varargin)
            self @ spm1d.stats.spm.SPMFList( SPMs )
            self @ spm1d.stats.nonparam.snpm.ASnPM0D(z, perm, varargin{:})
            % self.STAT    = 'F';
            % self.isanova = true;
        end
    end
end