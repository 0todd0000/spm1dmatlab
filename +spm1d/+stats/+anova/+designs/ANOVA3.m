%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef ANOVA3 < spm1d.stats.anova.designs.Design
    properties
        B
        C
    end
    
    
    methods
        function self = ANOVA3(A, B, C)
            self.A = spm1d.stats.anova.factors.Factor(A);
            self.B = spm1d.stats.anova.factors.Factor(B);
            self.C = spm1d.stats.anova.factors.Factor(C);
            self.J = self.A.J;
            self.effect_labels = {'Main A', 'Main B', 'Main C', 'Interaction AB', 'Interaction AC', 'Interaction BC', 'Interaction ABC'};
            self.term_labels = {'Intercept', 'A', 'B', 'C', 'AB', 'AC', 'BC', 'ABC'};
            self.f_terms = {{'A','Error'}, {'B','Error'}, {'C','Error'}, {'AB','Error'}, {'AC','Error'}, {'BC','Error'}, {'ABC','Error'}};
            self   = assemble(self);
            self.check_balanced()
        end
    end
    
    methods (Access = private)
        function self = assemble(self)
            %design matrix columns:
            XCONST = self.get_column_const();
            XA     = self.A.get_design_main();
            XB     = self.B.get_design_main();
            XC     = self.C.get_design_main();
            XAB    = self.A.get_design_interaction(self.B);
            XAC    = self.A.get_design_interaction(self.C);
            XBC    = self.B.get_design_interaction(self.C);
            XABC   = self.A.get_design_interaction_3way(self.B, self.C);
            %assemble:
            model  = spm1d.stats.anova.ModelBuilder(self.term_labels);
            model  = model.add_main_columns('Intercept', XCONST);
            model  = model.add_main_columns('A', XA);
            model  = model.add_main_columns('B', XB);
            model  = model.add_main_columns('C', XC);
            model  = model.add_main_columns('AB', XAB);
            model  = model.add_main_columns('AC', XAC);
            model  = model.add_main_columns('BC', XBC);
            model  = model.add_main_columns('ABC', XABC);
            self.X = model.get_design_matrix();
            self.contrasts = model.get_contrasts;
        end
        
        function check_balanced(self)
            if ~(self.A.balanced && self.B.balanced && self.C.balanced)
                error('Design must be balanced.')
            elseif ~self.A.check_balanced(self.B)
                error('Design must be balanced.')
            elseif ~self.A.check_balanced(self.C)
                error('Design must be balanced.')
            elseif ~self.B.check_balanced(self.C)
                error('Design must be balanced.')
            end
        end
        
    end

    
end