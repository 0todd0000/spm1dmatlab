%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky




classdef ModelBuilder
    properties
        COLS   = {};
        labels
        ncol   = 0;
        nTerms = 0;
        colD  
        XD
    end
    methods
        
        function [self] = ModelBuilder(labels, varargin)
            parser = inputParser;
            addOptional(parser, 'slabels', {}, @iscellstr);
            parser.parse(varargin{:});
            self.labels  = labels;
            values       = repmat({[]}, [1 numel(labels)]);
            self.XD      = containers.Map(labels, values);
            self.colD    = containers.Map(labels, values);
        end
        
        function [self] = add_main_columns(self, label, X)
            self.XD(label)   = X;
            [i0,nn]          = deal(self.ncol+1, size(X,2));
            self.colD(label) = i0:i0+nn-1;
            self.ncol        = self.ncol + nn;
            self.nTerms      = self.nTerms + 1;
            self.COLS{self.nTerms} = i0:i0+nn-1;
        end
        
        function [C]  = get_contrasts(self)
            C         = zeros(self.nTerms, self.ncol);
            for k = 1:self.nTerms
                cols = self.COLS{k};
                C(k,cols) = 1;
            end
            C         = spm1d.stats.anova.Contrasts(C, self.labels);
        end

        
        function [X] = get_design_matrix(self)
            X = [];
            for i = 1:self.nTerms
                x = self.XD( self.labels{i} );
                X = [X x]; %#ok<*AGROW>
            end
        end
       

       
   end
end