


classdef ANOVA2 < spm1d.stats.anova.designs.Design
    properties
        B
    end
    
    
    methods
        function self = ANOVA2(A, B)
            self.A = spm1d.stats.anova.factors.Factor(A);
            self.B = spm1d.stats.anova.factors.Factor(B);
            self.J = self.A.J;
            self   = assemble(self);
        end
    end
    
    methods (Access = private)
        function self = assemble(self)
            XA     = self.A.get_design_main();
            XB     = self.B.get_design_main();
            XAB    = self.A.get_design_interaction(self.B);
            XCONST = self.get_column_const();
            model  = spm1d.stats.anova.ModelBuilder({'A', 'B', 'AB', 'CONST'});
            model  = model.add_main_columns('A', XA);
            model  = model.add_main_columns('B', XB);
            model  = model.add_main_columns('AB', XAB);
            model  = model.add_main_columns('CONST', XCONST);
            self.X = model.get_design_matrix();
            CA     = model.get_contrast('A');
            CB     = model.get_contrast('B');
            CAB    = model.get_contrast('AB');
            self.contrasts = {CA, CB, CAB};
        end
        
    end

    
end