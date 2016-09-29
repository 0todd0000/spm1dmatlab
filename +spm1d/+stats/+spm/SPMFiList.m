%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef SPMFiList < spm1d.stats.spm.ASPMFList

    methods
        function [self] = SPMFiList(spmlist, SPMs)
            self @ spm1d.stats.spm.ASPMFList(SPMs)
            self.name                = 'SPM{F} inference list';
            self.dim                 = spmlist.dim;
            self.Q                   = spmlist.Q;
            self.design              = spmlist.design;
            self.effect_labels       = spmlist.effect_labels;
            self.effect_labels_short = spmlist.effect_labels_short;
            self.isparametric        = spmlist.isparametric;
            self.residuals           = spmlist.residuals;
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
    
    
    
    methods (Access = protected)
    
    
        function disp_summ_table(self)
            fprintf('Effects:\n')
            for i = 1:self.nEffects
                f  = self.SPMs{i};
                if self.dim == 0
                    fprintf('   %3s     F = %6.3f    df = (%d, %d)    p = %.5f\n', self.effect_labels_short{i}, f.z, f.df(1), f.df(2), f.p)
                else
                    fprintf('   %3s     F = [(1x%d) array]    df = (%d, %d)    h0reject = %d\n', self.effect_labels_short{i}, numel(f.z), f.df(1), f.df(2), f.h0reject)
                end
            end
        end
    
    
    end

end


