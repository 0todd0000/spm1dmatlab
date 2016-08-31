
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
        
        function [self] = plot(self, varargin)
            parser        = inputParser;
            addParameter(parser, 'FigureName', '', @ischar);
            parser.parse(varargin{:});
            figurename    = parser.Results.FigureName;
            figure('name', figurename)
            if self.nEffects <= 4
                m = 2;
            else
                m = 3;
            end
            for k = 1:self.nEffects
                subplot(m, m, k)
                spm = self.SPMs{k};
                spm.plot();
                title( spm.effect )
            end
        end
        
        
    end


end