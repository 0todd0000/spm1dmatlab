%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky




classdef ANOVA3rm < spm1d.stats.anova.designs.Design
    properties
        B
        C
        S
    end
    
    
    methods
        function self = ANOVA3rm(A, B, C, SUBJ)
            self.S = spm1d.stats.anova.factors.Factor(SUBJ);
            self.A = spm1d.stats.anova.factors.Factor(A);
            self.B = spm1d.stats.anova.factors.Factor(B);
            self.C = spm1d.stats.anova.factors.Factor(C);
            self.J = self.A.J;
            self.effect_labels = {'Main A', 'Main B', 'Main C', 'Interaction AB', 'Interaction AC', 'Interaction BC', 'Interaction ABC'};
            self.term_labels = {'Intercept',  'A','B','C','S',  'AB','AC','BC',   'SA','SB','SC',   'SAB','SAC','SBC',  'ABC', 'SABC'};
            self.f_terms = {{'A','SA'}, {'B','SB'}, {'C','SC'},  {'AB','SAB'},{'AC','SAC'},{'BC','SBC'},  {'ABC','SABC'}};
            self   = assemble(self);
            self.check_balanced()
        end
        
        
        function [only_single] = check_for_single_responses(self, dim)
            [A,B,C,S] = deal(self.A.A, self.B.A, self.C.A, self.S.A); %#ok<*PROP>
            only_single = false;
            for iA = 1:self.A.n
                for iB = 1:self.B.n
                    for iC = 1:self.C.n
                        [a,b,c] = deal( self.A.u(iA), self.B.u(iB), self.C.u(iC) );
                        s = S( (A==a) & (B==b) & (C==c) );
                        if numel(unique(s)) == numel(s)
                            only_single = true;
                            if dim==1
                                warning('Only one observation per subject found.  Residuals and inference will be approximate. To avoid approximate residuals: (a) Add multiple observations per subject and per condition, and (b) ensure that all subjects and conditions have the same number of observations.')
                            end
                            return
                        end
                    end
                end
            end
        end        
    end
    
    methods (Access = private)
        function self = assemble(self)
            %assemble design matrix columns:
            XCONST = self.get_column_const();
            XA     = self.A.get_design_main();
            XB     = self.B.get_design_main();
            XC     = self.C.get_design_main();
            XS     = self.S.get_design_main();
            XAB    = self.A.get_design_interaction(self.B);
            XAC    = self.A.get_design_interaction(self.C);
            XBC    = self.B.get_design_interaction(self.C);
            XSA    = self.S.get_design_interaction(self.A);
            XSB    = self.S.get_design_interaction(self.B);
            XSC    = self.S.get_design_interaction(self.C);
            XSAB   = self.S.get_design_interaction_3way(self.A, self.B);
            XSAC   = self.S.get_design_interaction_3way(self.A, self.C);
            XSBC   = self.S.get_design_interaction_3way(self.B, self.C);
            XABC   = self.A.get_design_interaction_3way(self.B, self.C);
            XSABC  = self.S.get_design_interaction_4way(self.A, self.B, self.C);
            %build model:
            model  = spm1d.stats.anova.ModelBuilder(self.term_labels);
            model  = model.add_main_columns('Intercept', XCONST);
            model  = model.add_main_columns('A', XA);
            model  = model.add_main_columns('B', XB);
            model  = model.add_main_columns('C', XC);
            model  = model.add_main_columns('S', XS);
            model  = model.add_main_columns('AB', XAB);
            model  = model.add_main_columns('AC', XAC);
            model  = model.add_main_columns('BC', XBC);
            model  = model.add_main_columns('SA', XSA);
            model  = model.add_main_columns('SB', XSB);
            model  = model.add_main_columns('SC', XSC);
            model  = model.add_main_columns('SAB', XSAB);
            model  = model.add_main_columns('SAC', XSAC);
            model  = model.add_main_columns('SBC', XSBC);
            model  = model.add_main_columns('ABC', XABC);
            model  = model.add_main_columns('SABC', XSABC);
            self.X = model.get_design_matrix();
            self.contrasts = model.get_contrasts;
        end
        
                
        function check_balanced(self)
            if ~(self.A.balanced && self.B.balanced && self.C.balanced && self.S.balanced)
                error('Design must be balanced.')
            elseif ~self.A.check_balanced(self.B)
                error('Design must be balanced.')
            elseif ~self.A.check_balanced(self.C)
                error('Design must be balanced.')
            elseif ~self.B.check_balanced(self.C)
                error('Design must be balanced.')
            elseif ~self.S.check_balanced(self.C)
                error('Design must be balanced.')
            end
        end
        
    end

    
end