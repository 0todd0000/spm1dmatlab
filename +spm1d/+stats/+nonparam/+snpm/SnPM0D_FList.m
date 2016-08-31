%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


% matlab.mixin.CustomDisplay
classdef SnPM0D_FList < spm1d.stats.nonparam.snpm.ASnPMFList

    methods
        function [self] = SnPM0D_FList(SnPMs, perm, varargin)
            self @ spm1d.stats.nonparam.snpm.ASnPMFList(SnPMs, perm, varargin)
        end
    end


end