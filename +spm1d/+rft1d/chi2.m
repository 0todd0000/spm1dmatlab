

classdef chi2
    methods (Static)
        %0D probabilities
        function [u] = isf0d(alpha, df)
            u = spm_invXcdf(1-alpha, df);
        end
        function [p] = sf0d(u, df)
            p = 1 - spm_Xcdf(u, df);
        end
        
        %1D probabilities:
        function [u] = isf(alpha, df, nodes, FWHM, varargin)
            withBonf = parse_varargin(varargin{:});
            calc = spm1d.rft1d.RFTCalculator('X', [1 df], nodes, FWHM, 'withBonf',withBonf);
            u = calc.isf(alpha);
        end
        
        function [p] = p_cluster(k, u, df, nodes, FWHM, varargin)
            withBonf = parse_varargin(varargin{:});
            calc = spm1d.rft1d.RFTCalculator('X', [1 df], nodes, FWHM, 'withBonf',withBonf);
            p = calc.p.cluster(k, u);
        end

        function [p] = p_set(c, k, u, df, nodes, FWHM, varargin)
            withBonf = parse_varargin(varargin{:});
            calc = spm1d.rft1d.RFTCalculator('X', [1 df], nodes, FWHM, 'withBonf',withBonf);
            p = calc.p.set(c, k, u);
        end
        
        function [p] = sf(u, df, nodes, FWHM, varargin)
            withBonf = parse_varargin(varargin{:});
            calc = spm1d.rft1d.RFTCalculator('X', [1 df], nodes, FWHM, 'withBonf',withBonf);
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
