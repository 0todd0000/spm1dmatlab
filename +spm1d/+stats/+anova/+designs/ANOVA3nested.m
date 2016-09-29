%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky




classdef ANOVA3nested < spm1d.stats.anova.designs.Design
    properties
        B
        C
    end
    
    
    methods
        function self = ANOVA3nested(A, B, C)
            self.A = spm1d.stats.anova.factors.Factor(A);
            self.B = spm1d.stats.anova.factors.FactorNested(B, self.A);
            self.C = spm1d.stats.anova.factors.FactorNested2(C, self.A, self.B);
            self.J = self.A.J;
            self.effect_labels = {'Main A', 'Main B', 'Main C'};
            self.term_labels = {'Intercept', 'A', 'B', 'C'};
            self.f_terms = {{'A','B'}, {'B', 'C'}, {'C','Error'}};
            self   = assemble(self);
            self.check_balanced()
        end
    end
    
    methods (Access = private)
        function self = assemble(self)
            %design matrix columns:
            XA     = self.A.get_design_main();
            XB     = self.B.get_design_main();
            XC     = self.C.get_design_main();
            XCONST = self.get_column_const();
            %assemble:
            model  = spm1d.stats.anova.ModelBuilder(self.term_labels);
            model  = model.add_main_columns('Intercept', XCONST);
            model  = model.add_main_columns('A', XA);
            model  = model.add_main_columns('B', XB);
            model  = model.add_main_columns('C', XC);
            self.X = model.get_design_matrix();
            self.contrasts = model.get_contrasts;
        end
        
    

        function check_balanced(self)
            if ~(self.A.balanced && self.B.balanced && self.C.balanced)
                error('Design must be balanced.')
            end
        end
        
    end

    
end