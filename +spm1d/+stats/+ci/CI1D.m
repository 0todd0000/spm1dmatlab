%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CI1D < spm1d.stats.ci.CIbase
    properties
        Q
        fwhm
        resels
    end
    
    methods
        function [self] = CI1D(spmi)
            self@spm1d.stats.ci.CIbase(spmi)
            self.name      = '1D Confidence Interval';
            self.dim       = 1;
            self.Q         = numel( spmi.z );
            self.fwhm      = spmi.fwhm;
            self.resels    = spmi.resels;
        end
    
        function plot(self, varargin)
            %parse inputs
            parser         = inputParser;
            addOptional(parser, 'color', 'k');
            addOptional(parser, 'facecolor', 0.7*[1 1 1]);
            addOptional(parser, 'facealpha', 0.5, @(x) isscalar(x) && (x>=0) && (x<=1) );
            parser.parse(varargin{:});
            color          = parser.Results.color;
            facecolor      = parser.Results.facecolor;
            facealpha      = parser.Results.facealpha;
            %plot:
            [y,h]          = deal(self.mean, self.hstar);
            spm1d.plot.plot_errorcloud(y, h, 'facecolor',facecolor, 'facealpha',facealpha);
            hold on
            plot(y, 'color',color, 'linewidth',3);
            if isscalar(self.mu)
                plot([0 self.Q-1], self.mu*[1 1], 'r--'); 
            else
                plot(0:self.Q-1, self.mu, 'r--'); 
            end
            hold off
        end
        
        
    end
        
%     methods(Static)
%         function plot_datum(x0, x1, y, color, linestyle)
%             plot([x0 x1], [y y], 'color',color, 'linestyle',linestyle)
%         end
%     end
    
    methods(Access = protected)
        function plot_multimean(self)
            linecolors      = {'k', 'r'};
            facecolors      = {[0.8 0.8 0.8], 'r'};
            facealphas      = [0.5 0.5];
            color_criterion = 'r';
            [mA,mB,h]       = deal(self.meanA, self.meanB, self.hstar);
            if isequal(self.criterion_type, 'meanB')
                spm1d.plot.plot_errorcloud(mA, h, 'facecolor',facecolors{1}, 'facealpha',facealphas(1));
                hold on
                plot(mA, 'color', linecolors{1}, 'linewidth',3);
                plot(mB, 'color', color_criterion, 'linestyle','--');
                
            elseif isequal(self.criterion_type, 'tailB')
                %plot meanA and CI with tail criteria:
                spm1d.plot.plot_errorcloud(mA, 0.5*h, 'facecolor',facecolors{1}, 'facealpha',facealphas(1));
                hold on
                plot(0:self.Q-1, mA+0.5*h, 'color', linecolors{1}, 'linestyle','--');
                plot(0:self.Q-1, mA-0.5*h, 'color', linecolors{1}, 'linestyle','--');
                %plot meanB and CI with tail criteria:
                spm1d.plot.plot_errorcloud(mB, 0.5*h, 'facecolor',facecolors{2}, 'facealpha',facealphas(2));
                plot(0:self.Q-1, mB+0.5*h, 'color', linecolors{2}, 'linestyle','--');
                plot(0:self.Q-1, mB-0.5*h, 'color', linecolors{2}, 'linestyle','--');
                %plot means:
                plot(0:self.Q-1, mA, 'color', linecolors{1}, 'linewidth',3);
                plot(0:self.Q-1, mB, 'color', linecolors{2}, 'linewidth',3);
            end
            hold off
        end
    end
    
    
end



