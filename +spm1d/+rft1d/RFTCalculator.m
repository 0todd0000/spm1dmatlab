%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: RFTCalculator.m 1 2016-01-04 16:07 todd $


classdef RFTCalculator
    properties
        FWHM
        Q
        STAT
        df
        mask
        nNodes
        n
        resels
        version = 'spm8';
        withBonf
        expected
        p
    end
    methods
        function self = RFTCalculator(varargin)
            %RFTCalculator(STAT, df, nodes, FWHM, n, withBonf, version)
            parser = inputParser;
            addOptional(parser, 'STAT','T', @(x)ismember(x, {'T','F','X','T2'}) );
            addOptional(parser, 'df', 1, @(x)isnumeric(x) && (isscalar(x) || isvector(x)) );
            addOptional(parser, 'nodes', 101, @(x) isscalar(x) || isvector(x));
            addOptional(parser, 'FWHM', 10, @isscalar);
            addOptional(parser, 'n', 1, @isscalar);
            addOptional(parser, 'withBonf', true, @islogical);
            addOptional(parser, 'version', 'spm8', @(x)ismember(x, {'spm8','spm12'}) );
            parser.parse(varargin{:});
            self.STAT     = parser.Results.STAT;
            self.df       = parser.Results.df;
            self.nNodes   = parser.Results.nodes;
            self.FWHM     = parser.Results.FWHM;
            self.n        = parser.Results.n;
            self.withBonf = parser.Results.withBonf;
            self.resels   = [1 (self.nNodes-1)/self.FWHM];
            %%% set dependent variables:
            if self.withBonf
                self.Q    = self.nNodes;
            else
                self.Q    = [];
            end
            self.mask     = ones(1,self.nNodes);
            %%% set other calculator objects:
            self.p        = spm1d.rft1d.RFTProbability(self);
            
        end
        
        
        function u = isf(self, alpha)
            [u] = spm_uc(alpha, self.df, self.STAT, self.resels, self.n, self.Q);
        end
        
        function p = sf(self, u)
           p = self.p.upcrossing(u);
        end
       
   end
    
end







