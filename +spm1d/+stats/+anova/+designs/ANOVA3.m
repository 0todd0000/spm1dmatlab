


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
            self   = assemble(self);
        end
    end
    
    methods (Access = private)
        function self = assemble(self)
            %design matrix columns:
            XA     = self.A.get_design_main();
            XB     = self.B.get_design_main();
            XC     = self.C.get_design_main();
            XAB    = self.A.get_design_interaction(self.B);
            XAC    = self.A.get_design_interaction(self.C);
            XBC    = self.B.get_design_interaction(self.C);
            XABC   = self.A.get_design_interaction_3way(self.B, self.C);
            XCONST = self.get_column_const();
            %assemble:
            clabels = {'A', 'B', 'C', 'AB', 'AC', 'BC', 'ABC', 'CONST'};
            model  = spm1d.stats.anova.ModelBuilder(clabels);
            model  = model.add_main_columns('A', XA);
            model  = model.add_main_columns('B', XB);
            model  = model.add_main_columns('C', XC);
            model  = model.add_main_columns('AB', XAB);
            model  = model.add_main_columns('AC', XAC);
            model  = model.add_main_columns('BC', XBC);
            model  = model.add_main_columns('ABC', XABC);
            model  = model.add_main_columns('CONST', XCONST);
            self.X = model.get_design_matrix();
            %create contrasts:
            self.contrasts  = cell(1, 7);
            for i = 1:numel(clabels(1:end-1))
                self.contrasts{i} = model.get_contrast(clabels{i});
            end
        end
        
    end

    
end