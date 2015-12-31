%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: T2.m 1 2016-01-04 16:07 todd $

classdef T2
    methods (Static)
        %0D probabilities
        function [u] = isf0d(alpha, df)
            [p,m] = deal(df(1), df(2));
            dfF   = [p, m-p+1];
            fstar = spm_invFcdf(1-alpha, dfF);
            u     = fstar / ( dfF(2)/(p*m) );
        end
        function [p] = sf0d(u, df)
            [p,m] = deal(df(1), df(2));
            dfF   = [p, m-p+1];
            F     = u * ( dfF(2)/(p*m) );
            p     = 1 - spm_Fcdf(F, dfF);
        end
        
        %1D probabilities:
        function [u] = isf(alpha, df, nodes, FWHM, varargin)
            withBonf = parse_varargin(varargin{:});
            calc = spm1d.rft1d.RFTCalculator('T2', df, nodes, FWHM, 'withBonf',withBonf);
            u = calc.isf(alpha);
        end
        
        function [p] = p_cluster(k, u, df, nodes, FWHM, varargin)
            withBonf = parse_varargin(varargin{:});
            calc = spm1d.rft1d.RFTCalculator('T2', df, nodes, FWHM, 'withBonf',withBonf);
            p = calc.p.cluster(k, u);
        end

        function [p] = p_set(c, k, u, df, nodes, FWHM, varargin)
            withBonf = parse_varargin(varargin{:});
            calc = spm1d.rft1d.RFTCalculator('T2', df, nodes, FWHM, 'withBonf',withBonf);
            p = calc.p.set(c, k, u);
        end
        
        function [p] = sf(u, df, nodes, FWHM, varargin)
            withBonf = parse_varargin(varargin{:});
            calc = spm1d.rft1d.RFTCalculator('T2', df, nodes, FWHM, 'withBonf',withBonf);
            p = calc.sf(u);
        end
        
        %1D probabilities (resel-based):
        function [u] = isf_resels(alpha, df, resels, varargin)
            [withBonf,nNodes] = parse_varargin(varargin{:});
            calc = spm1d.rft1d.RFTCalculatorResels('T2', df, resels, 'withBonf',withBonf, 'nNodes', nNodes);
            u = calc.isf(alpha);
        end
        
        function [p] = p_cluster_resels(k, u, df, resels, varargin)
            [withBonf,nNodes] = parse_varargin(varargin{:});
            calc = spm1d.rft1d.RFTCalculatorResels('T2', df, resels, 'withBonf',withBonf, 'nNodes', nNodes);
            p = calc.p.cluster(k, u);
        end

        function [p] = p_set_resels(c, k, u, df, resels, varargin)
            [withBonf,nNodes] = parse_varargin(varargin{:});
            calc = spm1d.rft1d.RFTCalculatorResels('T2', df, resels, 'withBonf',withBonf, 'nNodes', nNodes);
            p = calc.p.set(c, k, u);
        end
        
        function [p] = sf_resels(u, df, resels, varargin)
            [withBonf,nNodes] = parse_varargin(varargin{:});
            calc = spm1d.rft1d.RFTCalculatorResels('T2', df, resels, 'withBonf',withBonf, 'nNodes', nNodes);
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