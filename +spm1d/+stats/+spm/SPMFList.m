
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPMList.m 1 2016-01-04 16:07 todd $


classdef SPMFList < spm1d.stats.spm.ASPMFList
   
    methods
        function [self] = SPMFList(SPMs)
            self @ spm1d.stats.spm.ASPMFList(SPMs)
            self.name   = 'SPM{F} list';
        end

        function spmilist = inference(self, alpha)
           SPMis = cell(1, self.nEffects);
           for i = 1:self.nEffects
               spm = self.SPMs{i};
               spmi = spm.inference(alpha);
               SPMis{i} = spmi;
           end
           spmilist = spm1d.stats.spm.SPMFiList(self, SPMis);
        end
        
    end


end