%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef SnPM0D_FList < spm1d.stats.nonparam.snpm.ASnPMFList

    methods
        function [self] = SnPM0D_FList(SnPMs, perm, varargin)
            self @ spm1d.stats.nonparam.snpm.ASnPMFList(SnPMs, perm, varargin)
        end
    end


end