


classdef ANOVA1rm < spm1d.stats.anova.designs.Design
    properties
         S 
    end

    methods
        function self = ANOVA1rm(A, SUBJ)
            self.S = spm1d.stats.anova.factors.Factor(SUBJ);
            self.A = spm1d.stats.anova.factors.Factor(A);
            self.J = self.A.J;
            self.term_labels = {'Intercept', 'A', 'S', 'SA'};
            self.f_terms = {{'A','SA'}};
            self   = assemble(self);
            check_balanced(self)
        end
    end
    
    methods (Access = private)
        function self = assemble(self)
            XCONST  = self.get_column_const();
            XA      = self.A.get_design_main();
            XS      = self.S.get_design_main();
            XSA     = self.A.get_design_interaction(self.S);
            model   = spm1d.stats.anova.ModelBuilder(self.term_labels);
            model   = model.add_main_columns('Intercept', XCONST);
            model   = model.add_main_columns('A', XA);
            model   = model.add_main_columns('S', XS);
            model   = model.add_main_columns('SA', XSA);
            self.X  = model.get_design_matrix();
            self.contrasts = model.get_contrasts;
        end
        
        function check_balanced(self)
            if ~(self.A.balanced && self.S.balanced)
                error('Design must be balanced.')
            elseif ~self.S.check_balanced(self.A)
                error('Design must be balanced.')
            end
        end
        
        
    end

    
end