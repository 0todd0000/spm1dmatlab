

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
     end
   
    
end


function withBonf = parse_varargin(varargin)
    parser = inputParser;
    addOptional(parser, 'withBonf', false, @islogical);
    parser.parse(varargin{:});
    withBonf = parser.Results.withBonf;
end