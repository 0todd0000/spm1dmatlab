%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ANOVA2onerm.m 1 2016-01-04 16:07 todd $



classdef ANOVA2onerm < spm1d.stats.anova.designs.ANOVA2rm
    methods
        function self = ANOVA2onerm(A, B, SUBJ)
            self@spm1d.stats.anova.designs.ANOVA2rm(A, B, SUBJ)
%             self.A = spm1d.stats.anova.factors.Factor(A);
%             self.B = spm1d.stats.anova.factors.Factor(B);
            self.S = spm1d.stats.anova.factors.FactorNested(SUBJ, self.A);
%             self.J = self.A.J;
            self.term_labels = {'Intercept', 'A', 'B', 'S', 'AB', 'SB'};
            self.f_terms = {{'A','S'}, {'B','SB'}, {'AB','SB'}};
            self   = assemble(self);
            self.check_balanced()
        end
    end
    
    methods (Access = private)
        function self = assemble(self)
            %assemble design matrix columns:
            XCONST  = self.get_column_const();
            XA      = self.A.get_design_main();
            XB      = self.B.get_design_main();
            XS      = self.S.get_design_main();
            XAB     = self.A.get_design_interaction(self.B);
            XSB     = self.S.get_design_interaction(self.B);
            %build model:
            model   = spm1d.stats.anova.ModelBuilder(self.term_labels);
            model   = model.add_main_columns('Intercept', XCONST);
            model   = model.add_main_columns('A', XA);
            model   = model.add_main_columns('B', XB);
            model   = model.add_main_columns('S', XS);
            model   = model.add_main_columns('AB', XAB);
            model   = model.add_main_columns('SB', XSB);
            self.X  = model.get_design_matrix();
            self.contrasts = model.get_contrasts;
        end
        
        function check_balanced(self)
            if ~(self.B.balanced && self.S.balanced)
                error('Design must be balanced.')
            elseif ~self.S.check_balanced_rm(self.A)
                error('Design must be balanced.')
            elseif ~self.S.check_balanced_rm(self.B)
                error('Design must be balanced.')
            end
        end

        
    end

    
end