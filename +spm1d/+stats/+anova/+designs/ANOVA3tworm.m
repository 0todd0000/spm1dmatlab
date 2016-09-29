%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky




classdef ANOVA3tworm < spm1d.stats.anova.designs.ANOVA3rm
    methods
        function self = ANOVA3tworm(A, B, C, SUBJ)
            self@spm1d.stats.anova.designs.ANOVA3rm(A, B, C, SUBJ)
            self.A = spm1d.stats.anova.factors.Factor(A);
            self.B = spm1d.stats.anova.factors.Factor(B);
            self.C = spm1d.stats.anova.factors.Factor(C);
            self.S = spm1d.stats.anova.factors.FactorNested(SUBJ, self.A);
            self.J = self.A.J;
            self.effect_labels = {'Main A', 'Main B', 'Main C', 'Interaction AB', 'Interaction AC', 'Interaction BC', 'Interaction ABC'};
            self.term_labels = {'Intercept',  'A','B','C','S',  'AB','AC','BC',   'SB','SC',   'ABC', 'SBC'};
            self.f_terms = {{'A','S'}, {'B','SB'}, {'C','SC'},  {'AB','SB'},{'AC','SC'},{'BC','SBC'},  {'ABC','SBC'}};
            self      = assemble(self);
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
            XS     = self.S.get_design_main();
            XAB    = self.A.get_design_interaction(self.B);
            XAC    = self.A.get_design_interaction(self.C);
            XBC    = self.B.get_design_interaction(self.C);
            XSB    = self.S.get_design_interaction(self.B);
            XSC    = self.S.get_design_interaction(self.C);
            XABC   = self.A.get_design_interaction_3way(self.B, self.C);
            XSBC   = self.S.get_design_interaction_3way(self.B, self.C);
            %assemble:
            model  = spm1d.stats.anova.ModelBuilder(self.term_labels);
            model  = model.add_main_columns('Intercept', XCONST);
            model  = model.add_main_columns('A', XA);
            model  = model.add_main_columns('B', XB);
            model  = model.add_main_columns('C', XC);
            model  = model.add_main_columns('S', XS);
            model  = model.add_main_columns('AB', XAB);
            model  = model.add_main_columns('AC', XAC);
            model  = model.add_main_columns('BC', XBC);
            model  = model.add_main_columns('SB', XSB);
            model  = model.add_main_columns('SC', XSC);
            model  = model.add_main_columns('ABC', XABC);
            model  = model.add_main_columns('SBC', XSBC);
            self.X = model.get_design_matrix();
            self.contrasts = model.get_contrasts;
        end
        
        
        function check_balanced(self)
            if ~(self.A.balanced && self.B.balanced && self.C.balanced && self.S.balanced)
                error('Design must be balanced.')
            elseif ~self.A.check_balanced(self.B)
                error('Design must be balanced.')
            elseif ~self.A.check_balanced(self.C)
                error('Design must be balanced.')
            elseif ~self.B.check_balanced(self.C)
                error('Design must be balanced.')
            elseif ~self.S.check_balanced_rm(self.B)
                error('Design must be balanced.')
            elseif ~self.S.check_balanced_rm(self.C)
                error('Design must be balanced.')
            end
        end
        
        
    end
    
    
    
end