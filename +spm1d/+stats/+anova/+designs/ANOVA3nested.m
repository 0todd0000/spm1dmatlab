


classdef ANOVA3nested < spm1d.stats.anova.designs.Design
    properties
        B
        C
    end
    
    
    methods
        function self = ANOVA3nested(A, B, C)
            self.A = spm1d.stats.anova.factors.Factor(A);
            self.B = spm1d.stats.anova.factors.FactorNested(B, self.A);
            self.C = spm1d.stats.anova.factors.FactorNested2(C, self.A, self.B);
            self.J = self.A.J;
            self   = assemble(self);
        end
    end
    
    methods (Access = private)
        function self = assemble(self)
            %design matrix columns:
            XA     = self.A.get_design_main();
            XB     = self.B.get_design_main();
            XC     = self.C.get_design_main();
            XCONST = self.get_column_const();
            %assemble:
            clabels = {'A', 'B', 'C', 'CONST'};
            model  = spm1d.stats.anova.ModelBuilder(clabels);
            model  = model.add_main_columns('A', XA);
            model  = model.add_main_columns('B', XB);
            model  = model.add_main_columns('C', XC);
            model  = model.add_main_columns('CONST', XCONST);
            self.X = model.get_design_matrix();
            %create contrasts:
            self.contrasts  = cell(1, 3);
            for i = 1:numel(clabels(1:end-1))
                self.contrasts{i} = model.get_contrast(clabels{i});
            end
        end
        
    end

    
end