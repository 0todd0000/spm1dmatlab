


classdef FactorSubject
    properties
        A
        J
        u
        n
        isbalanced
    end
    methods
        function self = FactorSubject(A)
            self.A = A;
            self.J = numel(A);
            self.u = unique(A);
            self.n = numel(self.u);
            %check unbalanced:
            JJ = zeros(self.n,1);
            for k = 1:self.n
               JJ(k) = sum(A==self.u(k));
            end
            self.isbalanced = all(JJ==JJ(1));
       end
       
   end
    
end