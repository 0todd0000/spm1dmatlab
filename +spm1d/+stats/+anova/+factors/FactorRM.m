


classdef FactorRM < spm1d.stats.anova.factors.Factor
    properties
        S
    end
    
    methods
        
        function self = FactorRM(A, S)
            self@spm1d.stats.anova.factors.Factor(A)
            self.S    = S;
            self.isrm = true;

        end
        
        
        function [XS] = get_design_subject_partitioned(self)
           [A,S] = deal(self.A, self.S.A); %#ok<*PROP>
           XS   = [];
           for k = 1:self.nPairs
               [u0,u1] = deal(self.pairs(k,1), self.pairs(k,2));
               for kk = 1:self.S.n
                   u = self.S.u(kk);
                   x = zeros(self.J, 1);
                   x((A==u0)&(S==u)) = 1;
                   x((A==u1)&(S==u)) = -1;
                   XS = [XS x]; %#ok<*AGROW>
               end
           end
        end
        
        
        function [XS] = get_design_subject_partitioned3(self, other)
           [B,C,S] = deal(self.A, other.A, self.S.A); %#ok<*PROP>
           XS   = [];
           for k = 1:self.nPairs
               [uB0,uB1] = deal(self.pairs(k,1), self.pairs(k,2));
               for kk = 1:other.nPairs
                   [uC0,uC1] = deal(other.pairs(kk,1), other.pairs(kk,2));
                   for kkk = 1:self.S.n
                       u = self.S.u(kkk);
                       x = zeros(self.J, 1);
                       x((B==uB0)&(C==uC0)&(S==u)) = +1;
                       x((B==uB0)&(C==uC1)&(S==u)) = -1;
                       x((B==uB1)&(C==uC0)&(S==u)) = -1;
                       x((B==uB1)&(C==uC1)&(S==u)) = +1;
                       XS = [XS x]; %#ok<*AGROW>
                   end
               end
           end
       end

        
        function X = get_design_subject_pooled(self)
            [SS,u] = deal(self.S.A, self.S.u);
            X     = zeros(self.J, self.S.n);
            for k = 1:self.S.n
               X(SS==u(k),k) = 1;
           end
        end

        
        
       function [XS] = get_design_subject_interaction(self, other)
           [A,B,S]    = deal(self.A, other.A, self.S.A);  %#ok<*PROP>
           [nA,nB,nS] = deal(self.nPairs, other.nPairs, self.S.n);
           XS         = [];
           for k = 1:nA
               [uA0,uA1] = deal(self.pairs(k,1), self.pairs(k,2));
               for kk = 1:nB
                   [uB0,uB1] = deal(other.pairs(kk,1), other.pairs(kk,2));
                   for kkk = 1:nS
                       x  = zeros(self.J, 1);
                       u  = self.S.u(kkk);
                       x((A==uA0)&(B==uB0) & (S==u)) = +1;
                       x((A==uA0)&(B==uB1) & (S==u)) = -1;
                       x((A==uA1)&(B==uB0) & (S==u)) = -1;
                       x((A==uA1)&(B==uB1) & (S==u)) = +1;
                       XS = [XS x];
                   end
               end
           end
       end
       

       
       
   end
    
end