%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef SnPM1D_FiList < spm1d.stats.nonparam.snpm.ASnPMFiList

    methods
        function [self] = SnPM1D_FiList(SnPMs, perm, varargin)
            self @ spm1d.stats.nonparam.snpm.ASnPMFiList(SnPMs, perm, varargin)
            self.dim         = 1;
            self.isinference = true;
            self.nPermActual = perm.nPermActual;
            self             = self.set_nPermActual();
        end
        
        
        function [self] = plot(self, varargin)
            parser        = inputParser;
            addParameter(parser, 'FigureName', '', @ischar);
            addParameter(parser, 'plot_threshold_label', true, @islogical);
            addParameter(parser, 'plot_p_values', true, @islogical);
            addParameter(parser, 'autoset_ylim', true, @islogical);
            parser.parse(varargin{:});
            figurename           = parser.Results.FigureName;
            plot_threshold_label = parser.Results.plot_threshold_label;
            plot_p_values        = parser.Results.plot_p_values;
            autoset_ylim         = parser.Results.autoset_ylim;
            figure('name', figurename)
            if self.nEffects <= 4
                m = 2;
            else
                m = 3;
            end
            myylim = zeros(self.nEffects,2);
            axx    = zeros(self.nEffects,1);
            for k = 1:self.nEffects
                ax = subplot(m, m, k);
                spm = self.SPMs{k};
                spm.plot();
                if plot_threshold_label
                    spm.plot_threshold_label();
                end
                if plot_p_values
                    spm.plot_p_values();
                end
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
    
    methods (Access = private)
        
        function [self] = set_nPermActual(self)
            for i = 1:self.nEffects
                snpm = self.SPMs{i};
                snpm.nPermActual = self.nPermActual;
                self.SPMs{i} = snpm;
            end
        end
        
    end
    


end