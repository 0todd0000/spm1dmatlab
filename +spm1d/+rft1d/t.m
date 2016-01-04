%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: t.m 1 2016-01-04 16:07 todd $

classdef t
    methods (Static)
        %0D probabilities
        function [u] = isf0d(alpha, df)
            u = spm_invTcdf(1-alpha, df);
        end
        function [p] = sf0d(u, df)
            p = 1 - spm_Tcdf(u, df);
        end
        
        %1D probabilities:
        function [u] = isf(alpha, df, nodes, FWHM, varargin)
            withBonf = parse_varargin(varargin{:});
            calc = spm1d.rft1d.RFTCalculator('T', [1 df], nodes, FWHM, 'withBonf',withBonf);
            u = calc.isf(alpha);
        end
        
        function [p] = p_cluster(k, u, df, nodes, FWHM, varargin)
            withBonf = parse_varargin(varargin{:});
            calc = spm1d.rft1d.RFTCalculator('T', [1 df], nodes, FWHM, 'withBonf',withBonf);
            p = calc.p.cluster(k, u);
        end

        function [p] = p_set(c, k, u, df, nodes, FWHM, varargin)
            withBonf = parse_varargin(varargin{:});
            calc = spm1d.rft1d.RFTCalculator('T', [1 df], nodes, FWHM, 'withBonf',withBonf);
            p = calc.p.set(c, k, u);
        end
        
        function [p] = sf(u, df, nodes, FWHM, varargin)
            withBonf = parse_varargin(varargin{:});
            calc = spm1d.rft1d.RFTCalculator('T', [1 df], nodes, FWHM, 'withBonf',withBonf);
            p = calc.sf(u);
        end
        
        
        %1D probabilities (resel-based):
        function [u] = isf_resels(alpha, df, resels, varargin)
            [withBonf,nNodes] = parse_varargin(varargin{:});
            calc = spm1d.rft1d.RFTCalculatorResels('T', [1 df], resels, 'withBonf',withBonf, 'nNodes', nNodes);
            u = calc.isf(alpha);
        end
        
        function [p] = p_cluster_resels(k, u, df, resels, varargin)
            [withBonf,nNodes] = parse_varargin(varargin{:});
            calc = spm1d.rft1d.RFTCalculatorResels('T', [1 df], resels, 'withBonf',withBonf, 'nNodes', nNodes);
            p = calc.p.cluster(k, u);
        end

        function [p] = p_set_resels(c, k, u, df, resels, varargin)
            [withBonf,nNodes] = parse_varargin(varargin{:});
            calc = spm1d.rft1d.RFTCalculatorResels('T', [1 df], resels, 'withBonf',withBonf, 'nNodes', nNodes);
            p = calc.p.set(c, k, u);
        end
        
        function [p] = sf_resels(u, df, resels, varargin)
            [withBonf,nNodes] = parse_varargin(varargin{:});
            calc = spm1d.rft1d.RFTCalculatorResels('T', [1 df], resels, 'withBonf',withBonf, 'nNodes', nNodes);
            p = calc.sf(u);
        end    
        
        
    end
   
    
end


function [withBonf,nNodes] = parse_varargin(varargin)
    parser = inputParser;
    addOptional(parser, 'withBonf', false, @islogical);
    addOptional(parser, 'nNodes', 0, @isscalar);
    parser.parse(varargin{:});
    withBonf = parser.Results.withBonf;
    nNodes = parser.Results.nNodes;
end
