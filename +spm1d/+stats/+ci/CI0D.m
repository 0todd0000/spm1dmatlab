%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CI0D < spm1d.stats.ci.CIbase
    methods
        function [self] = CI0D(spmi)
            self@spm1d.stats.ci.CIbase(spmi)
            self.name      = '0D Confidence Interval';
            self.dim       = 0;
        end
    
        function plot(self)
            x      = 0;
            hbarw  = 0.1;
            self.plot_errorbar(x, self.mean, self.hstar, hbarw, 'b')
            hold on
            w      = hbarw * self.hstar;
            self.plot_datum(x-w, x+w, self.mu, 'r', '--')
        end
        
        
    end
        
    methods(Static)
        function plot_datum(x0, x1, y, color, linestyle)
            plot([x0 x1], [y y], 'color',color, 'linestyle',linestyle)
        end
        function plot_errorbar(x, y, e, hbarw, color)
            plot(x, y, 'o', 'markersize',10, 'color',color, 'markerfacecolor',color)
            hold on
            h0 = plot([x x], [y-e y+e], '-');
            w = hbarw * e;
            h1 = plot([x-w x+w], [y-e y-e], '-');
            h2 = plot([x-w x+w], [y+e y+e], '-');
            set([h0 h1 h2], 'color', color, 'linewidth', 3)
            hold off
        end

    end
    
    methods(Access = protected)
        function plot_multimean(self)
            color           = 'b';
            color_criterion = 'r';
            hbarw           = 0.1;
            w               = hbarw * self.hstar;
            [x0,x1]         = deal(0, 2.4 * hbarw * self.hstar );

            if isequal(self.criterion_type, 'meanB')
                self.plot_errorbar(x0, self.meanA, self.hstar, hbarw, color)
                hold on
                plot(x1, self.meanB, 'o', 'markersize', 10, 'color', color_criterion, 'markerfacecolor',color_criterion)
                self.plot_datum(x0-w, x1+0.1*w, self.meanB, color_criterion, '--')
            
            elseif isequal(self.criterion_type, 'tailB')
                x1           = 1.2 * hbarw * self.hstar;
                self.plot_errorbar(x0, self.meanA, 0.5*self.hstar, hbarw, color)
                hold on
                self.plot_errorbar(x1, self.meanB, 0.5*self.hstar, hbarw, color_criterion)
                hold on
                if self.meanB > self.meanA
                    ytailB = self.meanB - 0.5 * self.hstar;
                else
                    ytailB = self.meanB + 0.5 * self.hstar;
                end
                self.plot_datum(x0-w, x1+0.1*w, ytailB, color_criterion, '--')
            end
                
            hold off
        end
    end
    
    
end



