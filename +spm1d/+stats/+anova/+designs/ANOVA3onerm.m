


classdef ANOVA3onerm < spm1d.stats.anova.designs.Design
    properties
        B
        C
        S
        swap
    end
    
    
    methods
        function self = ANOVA3onerm(A, B, C, SUBJ)
            self.S    = spm1d.stats.anova.factors.FactorSubject(SUBJ);
            self.A    = spm1d.stats.anova.factors.FactorRM(A, self.S);
            self.B    = spm1d.stats.anova.factors.FactorRM(B, self.S);
            self.C    = spm1d.stats.anova.factors.FactorRM(C, self.S);
            self.J    = self.A.J;
            self.swap = self.A.n > self.B.n;
            self      = self.swapAB();
            self      = assemble(self);
            self      = self.swapAB();
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
            XSpool = self.A.get_design_subject_pooled();
            XSC    = self.C.get_design_subject_partitioned();
            %assemble:
            clabels = {'A', 'B', 'C', 'AB', 'AC', 'BC', 'ABC', 'CONST'};
            model  = spm1d.stats.anova.ModelBuilder(clabels, {'Spooled','SC'});
            model  = model.add_main_columns('A', XA);
            model  = model.add_main_columns('B', XB);
            model  = model.add_main_columns('C', XC);
            model  = model.add_main_columns('AB', XAB);
            model  = model.add_main_columns('AC', XAC);
            model  = model.add_main_columns('BC', XBC);
            model  = model.add_main_columns('ABC', XABC);
            model  = model.add_main_columns('CONST', XCONST);
            model  = model.add_subj_columns('Spooled', XSpool);
            model  = model.add_subj_columns('SC', XSC);
            self.X = model.get_design_matrix();
            %create contrasts:
            self.contrasts  = cell(1, 7);
            sspairs         = cell(1,7);
            if self.swap
                sspairs{1}  = {'B','Spooled'};
                sspairs{2}  = {'A','Spooled'};
                sspairs{3}  = {'C','SC'};
                sspairs{4}  = {'AB','Spooled'};
                sspairs{5}  = {'BC','SC'};
                sspairs{6}  = {'AC','SC'};
                sspairs{7}  = {'ABC','SC'};
            else
                sspairs{1}  = {'A','Spooled'};
                sspairs{2}  = {'B','Spooled'};
                sspairs{3}  = {'C','SC'};
                sspairs{4}  = {'AB','Spooled'};
                sspairs{5}  = {'AC','SC'};
                sspairs{6}  = {'BC','SC'};
                sspairs{7}  = {'ABC','SC'};
            end
            for i = 1:7
                sspair = sspairs{i};
                [s0,s1] = deal(sspair{1}, sspair{2});
                self.contrasts{i} = model.get_contrast_compound(s0, s1);
            end
        end
        
        function [self] = swapAB(self)
            if self.swap
                [A,B] = deal(self.B, self.A);
                self.A = A;
                self.B = B; %#ok<*PROP>
            end
        end
        
        
    end
    
    
    
end