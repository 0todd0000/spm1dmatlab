
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef SPMFList < spm1d.stats.spm.ASPMFList
    
    methods
        function [self] = SPMFList(SPMs)
            self @ spm1d.stats.spm.ASPMFList(SPMs)
            self.name   = 'SPM{F} list';
            spm         = SPMs{1};
            self.Q      = spm.Q;
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
            addParameter(parser, 'autoset_ylim', true, @islogical);
            parser.parse(varargin{:});
            figurename    = parser.Results.FigureName;
            autoset_ylim  = parser.Results.autoset_ylim;
            figure('name', figurename)
            if self.nEffects <= 4
                m = 2;
            else
                m = 3;
            end
            myylim = zeros(self.nEffects,2);
            axx    = zeros(self.nEffects,1);
            for k = 1:self.nEffects
                ax  = subplot(m, m, k);
                spm = self.SPMs{k};
                spm.plot();
                title( spm.effect )
                xlim([0 self.Q])
                myylim(k,:) = get(ax, 'ylim');
                axx(k) = ax;
            end
            if autoset_ylim
                set(axx, 'ylim', [ min(myylim(:,1))  max(myylim(:,2)) ] )
            end

        end
        
        
    end


end