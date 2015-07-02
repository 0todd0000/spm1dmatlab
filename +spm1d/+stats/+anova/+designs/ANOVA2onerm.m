


classdef ANOVA2onerm < spm1d.stats.anova.designs.Design
    properties
        B
        S
    end
    
    
    methods
        function self = ANOVA2onerm(A, B, SUBJ)
            self.S = spm1d.stats.anova.factors.FactorSubject(SUBJ);
            self.A = spm1d.stats.anova.factors.FactorRM(A, self.S);
            self.B = spm1d.stats.anova.factors.FactorRM(B, self.S);
            self.J = self.A.J;
            self   = assemble(self);
        end
    end
    
    methods (Access = private)
        function self = assemble(self)
            %assemble design matrix columns:
            XA      = self.A.get_design_main();
            XB      = self.B.get_design_main();
            XAB     = self.A.get_design_interaction(self.B);
            XCONST  = self.get_column_const();
            XSApool = self.A.get_design_subject_pooled();
            XSB     = self.B.get_design_subject_partitioned();
            %build model:
            model   = spm1d.stats.anova.ModelBuilder({'A', 'B', 'AB', 'CONST'}, {'SApooled', 'SB'});
            model   = model.add_main_columns('A', XA);
            model   = model.add_main_columns('B', XB);
            model   = model.add_main_columns('AB', XAB);
            model   = model.add_main_columns('CONST', XCONST);
            model   = model.add_subj_columns('SApooled', XSApool);
            model   = model.add_subj_columns('SB', XSB);
            self.X  = model.get_design_matrix();
            CA      = model.get_contrast_compound('A', 'SApooled');
            CB      = model.get_contrast_compound('B', 'SB');
            CAB     = model.get_contrast_compound('AB', 'SB');
            self.contrasts = {CA, CB, CAB};
        end
        
    end

    
end