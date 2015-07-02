


classdef ANOVA1rm < spm1d.stats.anova.designs.Design
    properties
         S 
    end

    methods
        function self = ANOVA1rm(A, SUBJ)
            self.S = spm1d.stats.anova.factors.FactorSubject(SUBJ);
            self.A = spm1d.stats.anova.factors.FactorRM(A, self.S);
            self.J = self.A.J;
            self   = assemble(self);
        end
    end
    
    methods (Access = private)
        function self = assemble(self)
            XA      = self.A.get_design_main();
            XCONST  = self.get_column_const();
            XS      = self.A.get_design_subject_pooled();
            model   = spm1d.stats.anova.ModelBuilder({'A', 'CONST'}, {'XS'});
            model   = model.add_main_columns('A', XA);
            model   = model.add_main_columns('CONST', XCONST);
            model   = model.add_subj_columns('XS', XS);
            self.X  = model.get_design_matrix();
            CA      = model.get_contrast('A');
            self.contrasts = {CA};
        end
        
    end

    
end