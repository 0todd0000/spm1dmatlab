%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef ANOVA2rm < spm1d.stats.anova.designs.Design
    properties
        B
        S
    end
    
    
    methods
        function self = ANOVA2rm(A, B, SUBJ)
            self.S = spm1d.stats.anova.factors.Factor(SUBJ);
            self.A = spm1d.stats.anova.factors.Factor(A);
            self.B = spm1d.stats.anova.factors.Factor(B);
            self.J = self.A.J;
            self.effect_labels = {'Main A', 'Main B', 'Interaction AB'};
            self.term_labels = {'Intercept', 'A', 'B', 'S', 'AB', 'SA', 'SB', 'SAB'};
            self.f_terms = {{'A','SA'}, {'B','SB'}, {'AB','SAB'}};
            self   = assemble(self);
            self.check_balanced()
        end
        
        function [only_single] = check_for_single_responses(self, dim)
            [A,B,S] = deal(self.A.A, self.B.A, self.S.A); %#ok<*PROP>
            only_single = false;
            for iA = 1:self.A.n
                for iB = 1:self.B.n
                    [a,b] = deal( self.A.u(iA), self.B.u(iB) );
                    s = S( (A==a) & (B==b) );
                    if numel(unique(s)) == numel(s)
                        only_single = true;
                        if dim==1
                            warning('Only one observation per subject found.  Residuals and inference will be approximate. To avoid approximate residuals: (a) Add multiple observations per subject and per condition, and (b) ensure that all subjects and conditions have the same number of observations.')
                        end
                        return
                    end
                end
            end
        end
        

        
    end
    
    methods (Access = private)
        function self = assemble(self)
            %assemble design matrix columns:
            XCONST = self.get_column_const();
            XA     = self.A.get_design_main();
            XB     = self.B.get_design_main();
            XS     = self.S.get_design_main();
            XAB    = self.A.get_design_interaction(self.B);
            XSA    = self.A.get_design_interaction(self.S);
            XSB    = self.B.get_design_interaction(self.S);
            XSAB   = self.A.get_design_interaction_3way(self.B, self.S);
            %build model:
            model  = spm1d.stats.anova.ModelBuilder(self.term_labels);
            model  = model.add_main_columns('Intercept', XCONST);
            model  = model.add_main_columns('A', XA);
            model  = model.add_main_columns('B', XB);
            model  = model.add_main_columns('S', XS);
            model  = model.add_main_columns('AB', XAB);
            model  = model.add_main_columns('SA', XSA);
            model  = model.add_main_columns('SB', XSB);
            model  = model.add_main_columns('SAB', XSAB);
            self.X = model.get_design_matrix();
            self.contrasts = model.get_contrasts;
        end
        
        function check_balanced(self)
            if ~(self.A.balanced && self.B.balanced && self.S.balanced)
                error('Design must be balanced.')
            end
            if ~ self.A.check_balanced(self.B)
                error('Design must be balanced.')
            end
            if ~ self.S.check_balanced(self.A)
                error('Design must be balanced.')
            end
            if ~ self.S.check_balanced(self.B)
                error('Design must be balanced.')
            end
        end
        
    end

    
end