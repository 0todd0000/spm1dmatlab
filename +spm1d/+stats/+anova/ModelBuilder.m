


classdef ModelBuilder
    properties
        labels
        slabels
        n
        nS
        ncol   = 0;
        ncolS  = 0;
        ncolT  = 0;
        colD  
        colSD 
        XD
        XSD
    end
    methods
        
        function [self] = ModelBuilder(labels, varargin)
            parser = inputParser;
            addOptional(parser, 'slabels', {}, @iscellstr);
            parser.parse(varargin{:});
            self.labels  = labels;
            self.slabels = parser.Results.slabels;
            self.n       = numel(labels);
            self.nS      = numel(self.slabels);
            values       = repmat({[]}, [1 self.n]);
            self.XD      = containers.Map(labels, values);
            self.colD    = containers.Map(labels, values);
            if self.nS > 0
                svalues    = repmat({[]}, [1 self.nS]);
                self.XSD   = containers.Map(self.slabels, svalues);
                self.colSD = containers.Map(self.slabels, svalues);
            else
                self.XSD   = containers.Map;
                self.colSD = containers.Map;
            end

            
        end
        
        function [self] = add_main_columns(self, label, X)
            self.XD(label)   = X;
            [i0,nn]          = deal(self.ncol+1, size(X,2));
            self.colD(label) = i0:i0+nn-1;
            self.ncol        = self.ncol + nn;
            self.ncolT       = self.ncolT + nn;
        end
        
        function [self] = add_subj_columns(self, label, X)
            self.XSD(label)   = X;
            [i0,nn]           = deal(self.ncolS+1, size(X,2));
            self.colSD(label) = i0:i0+nn-1;
            self.ncolS        = self.ncolS + nn;
            self.ncolT        = self.ncolT + nn;
        end
        
        function [C]  = get_contrast(self, label)
            cols      = self.colD(label);
            nn        = numel(cols);
            C         = zeros(nn, self.ncolT);
            C(:,cols) = eye(nn);
            C         = spm1d.stats.anova.contrasts.Contrast(C);
        end
   
        function [C]  = get_contrast_compound(self, label, slabel)
            if iscellstr(slabel)
                C     = self.get_contrast_compound3(label, slabel);
                return
            end
            [cols,scols]  = deal(self.colD(label), self.colSD(slabel)+self.ncol);
            [nn,nns]      = deal(numel(cols), numel(scols));
            [C,CS]        = deal(zeros(nn,self.ncolT), zeros(nns,self.ncolT));
            C(:,cols)     = eye(nn);
            CS(:,scols)   = eye(nns);
            C             = spm1d.stats.anova.contrasts.CompoundContrast(C, CS);
        end
        
%         function [C]  = get_contrast_compound3(self, label, slabels)
%             C = 'buta san';
%         end
        
        
        function [X] = get_design_matrix(self)
            X = [];
            for i = 1:self.n
                x = self.XD( self.labels{i} );
                X = [X x]; %#ok<*AGROW>
            end
            if self.nS > 0
                XS = [];
                for i = 1:self.nS
                    x  = self.XSD( self.slabels{i} );
                    XS = [XS x]; %#ok<*AGROW>
                end
                X = [X XS];
            end
        end
       

       
       
   end
    
end