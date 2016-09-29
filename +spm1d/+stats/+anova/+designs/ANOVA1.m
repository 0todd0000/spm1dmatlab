%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky




classdef ANOVA1 < spm1d.stats.anova.designs.Design

    methods
        function self = ANOVA1(A)
            self.A             = spm1d.stats.anova.factors.Factor(A);
            self.J             = self.A.J;
            self.effect_labels = {'Main A'};
            self.term_labels   = {'Intercept', 'A'};
            self.f_terms       = {{'A','Error'}};
            self               = assemble(self);
        end
    end
    
    methods (Access = private)
        function self = assemble(self)
            XA     = self.A.get_design_main();
            XCONST = self.get_column_const();
            model  = spm1d.stats.anova.ModelBuilder(self.term_labels);
            model  = model.add_main_columns('Intercept', XCONST);
            model  = model.add_main_columns('A', XA);
            self.X = model.get_design_matrix();
            self.contrasts = model.get_contrasts;
        end
        
    end

    
end