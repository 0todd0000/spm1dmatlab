%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPMiList.m 1 2016-01-04 16:07 todd $


classdef SPMFiList < spm1d.stats.spm.ASPMFList

    methods
        function [self] = SPMFiList(spmlist, SPMs)
            self @ spm1d.stats.spm.ASPMFList(SPMs)
            % self.SPMs      = SPMs;
            self.name                = 'SPM{F} inference list';
            self.dim                 = spmlist.dim;
            self.design              = spmlist.design;
            self.effect_labels       = spmlist.effect_labels;
            self.effect_labels_short = spmlist.effect_labels_short;
            self.isparametric        = spmlist.isparametric;
            self.residuals           = spmlist.residuals;
        end
    
        function [self] = plot(self)
            figure
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


