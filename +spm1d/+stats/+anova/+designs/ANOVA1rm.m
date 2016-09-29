%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky




classdef ANOVA1rm < spm1d.stats.anova.designs.Design
    properties
         S 
    end

    methods
        function self = ANOVA1rm(A, SUBJ)
            self.S             = spm1d.stats.anova.factors.Factor(SUBJ);
            self.A             = spm1d.stats.anova.factors.Factor(A);
            self.J             = self.A.J;
            self.effect_labels = {'Main A'};
            self.term_labels   = {'Intercept', 'A', 'S', 'SA'};
            self.f_terms       = {{'A','SA'}};
            self               = assemble(self);
            check_balanced(self)
        end
        
        function [only_single] = check_for_single_responses(self, dim)
            [A,S] = deal(self.A.A, self.S.A); %#ok<*PROP>
            only_single = false;
            for iA = 1:self.A.n
                a = self.A.u(iA);
                s = S( (A==a) );
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
    
    methods (Access = private)
        function self = assemble(self)
            XCONST  = self.get_column_const();
            XA      = self.A.get_design_main();
            XS      = self.S.get_design_main();
            XSA     = self.A.get_design_interaction(self.S);
            model   = spm1d.stats.anova.ModelBuilder(self.term_labels);
            model   = model.add_main_columns('Intercept', XCONST);
            model   = model.add_main_columns('A', XA);
            model   = model.add_main_columns('S', XS);
            model   = model.add_main_columns('SA', XSA);
            self.X  = model.get_design_matrix();
            self.contrasts = model.get_contrasts;
        end
        
        function check_balanced(self)
            if ~(self.A.balanced && self.S.balanced)
                error('Design must be balanced.')
            elseif ~self.S.check_balanced(self.A)
                error('Design must be balanced.')
            end
        end
        
        
    end

    
end