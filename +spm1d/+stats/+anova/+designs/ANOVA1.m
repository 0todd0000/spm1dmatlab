


classdef ANOVA1 < spm1d.stats.anova.designs.Design

    methods
        function self = ANOVA1(A)
            self.A = spm1d.stats.anova.factors.Factor(A);
            self.J = self.A.J;
            self   = assemble(self);
        end
    end
    
    methods (Access = private)
        function self = assemble(self)
            XA     = self.A.get_design_main();
            XCONST = self.get_column_const();
            model  = spm1d.stats.anova.ModelBuilder({'A', 'CONST'});
            model  = model.add_main_columns('A', XA);
            model  = model.add_main_columns('CONST', XCONST);
            self.X = model.get_design_matrix();
            CA     = model.get_contrast('A');
            self.contrasts = {CA};
        end
        
    end

    
end