
classdef CompoundContrast < spm1d.stats.anova.contrasts.Contrast
    properties
        n
    end
    methods
        function self = CompoundContrast(C, CS)
            self@spm1d.stats.anova.contrasts.Contrast(C)
            self.C    = [C; CS];
            self.isrm = true;
            self.n    = size(C,1);
        end
        function [c,ce] = get_compound_matrices(self)
            c = self.C;
            ce = self.C(self.n+1:end,:);
        end
   end
end