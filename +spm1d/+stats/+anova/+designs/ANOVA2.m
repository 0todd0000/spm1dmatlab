%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky




classdef ANOVA2 < spm1d.stats.anova.designs.Design
    properties
        B
    end
    
    
    methods
        function self = ANOVA2(A, B)
            self.A             = spm1d.stats.anova.factors.Factor(A);
            self.B             = spm1d.stats.anova.factors.Factor(B);
            self.J             = self.A.J;
            self.effect_labels = {'Main A', 'Main B', 'Interaction AB'};
            self.term_labels   = {'Intercept', 'A', 'B', 'AB'};
            self.f_terms       = {{'A','Error'}, {'B','Error'}, {'AB','Error'}};
            self               = assemble(self);
            self.check_balanced()
        end
    end
    
    methods (Access = private)
        function self = assemble(self)
            XCONST = self.get_column_const();
            XA     = self.A.get_design_main();
            XB     = self.B.get_design_main();
            XAB    = self.A.get_design_interaction(self.B);
            model  = spm1d.stats.anova.ModelBuilder(self.term_labels);
            model  = model.add_main_columns('Intercept', XCONST);
            model  = model.add_main_columns('A', XA);
            model  = model.add_main_columns('B', XB);
            model  = model.add_main_columns('AB', XAB);
            self.X = model.get_design_matrix();
            self.contrasts = model.get_contrasts;
        end
        
        function check_balanced(self)
            if ~(self.A.balanced && self.B.balanced)
                error('Design must be balanced.')
            elseif ~self.A.check_balanced(self.B)
                error('Design must be balanced.')
            end
        end

        
    end

    
end