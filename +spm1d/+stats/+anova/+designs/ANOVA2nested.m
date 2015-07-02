


classdef ANOVA2nested < spm1d.stats.anova.designs.Design
    properties
        B
    end
    
    methods
        function self = ANOVA2nested(A, B)
            self.A = spm1d.stats.anova.factors.Factor(A);
            self.B = spm1d.stats.anova.factors.FactorNested(B, self.A);
            self.J = self.A.J;
            self   = assemble(self);
        end
    end
    
    methods (Access = private)
        function self = assemble(self)
            XA     = self.A.get_design_main();
            XB     = self.B.get_design_main();
            XCONST = self.get_column_const();
            model  = spm1d.stats.anova.ModelBuilder({'A', 'B', 'CONST'});
            model  = model.add_main_columns('A', XA);
            model  = model.add_main_columns('B', XB);
            model  = model.add_main_columns('CONST', XCONST);
            self.X = model.get_design_matrix();
            CA     = model.get_contrast('A');
            CB     = model.get_contrast('B');
            self.contrasts = {CA, CB};
        end
        
    end

    
end