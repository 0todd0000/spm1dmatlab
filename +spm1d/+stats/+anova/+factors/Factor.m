


classdef Factor
    properties
        A
        J
        u
        n
        pairs
        nPairs
        isnested    = false;
        isrm        = false;
        isbalanced  = true;
        nested      = [];
    end
    methods
        
        function self = Factor(A, varargin)
            self.A = A;
            self.J = numel(A);
            self.u = unique(A);
            self.n = numel(self.u);
            self.pairs = [self.u(1:end-1) self.u(2:end)];
            if self.n > 4
               self.pairs = [self.pairs; self.u([end 1])'];
            end
            self.nPairs = size(self.pairs,1);
            %check unbalanced:
            JJ = zeros(self.n,1);
            for k = 1:self.n
               JJ(k) = sum(A==self.u(k));
            end
            self.isbalanced = all(JJ==JJ(1));
       end
       
       function X = get_design_interaction(self, other)
           [A,B]   = deal(self.A, other.A);  %#ok<*PROP>
           [nA,nB] = deal(self.nPairs, other.nPairs);
           X   = zeros(self.J, nA*nB);
           ind = 0;
           for k = 1:nA
               [uA0,uA1] = deal(self.pairs(k,1), self.pairs(k,2));
               for kk = 1:nB
                   ind = ind + 1;
                   [uB0,uB1] = deal(other.pairs(kk,1), other.pairs(kk,2));
                   X((A==uA0)&(B==uB0),ind) = 1; 
                   X((A==uA0)&(B==uB1),ind) = -1;
                   X((A==uA1)&(B==uB0),ind) = -1;
                   X((A==uA1)&(B==uB1),ind) = 1;
               end
           end
       end
       
        function [X] = get_design_interaction_3way(self, other, another)
           [A,B,C]    = deal(self.A, other.A, another.A);  %#ok<*PROP>
           [nA,nB,nC] = deal(self.nPairs, other.nPairs, another.nPairs);
           X          = [];
           for k = 1:nA
               [uA0,uA1] = deal(self.pairs(k,1), self.pairs(k,2));
               for kk = 1:nB
                   [uB0,uB1] = deal(other.pairs(kk,1), other.pairs(kk,2));
                   for kkk = 1:nC
                       [uC0,uC1] = deal(another.pairs(kkk,1), another.pairs(kkk,2));
                       x = zeros(self.J, 1);
                       %part one:
                       x((A==uA0)&(B==uB0)&(C==uC0)) = +1;
                       x((A==uA0)&(B==uB0)&(C==uC1)) = -1;
                       x((A==uA0)&(B==uB1)&(C==uC0)) = -1;
                       x((A==uA0)&(B==uB1)&(C==uC1)) = +1;
                       %part two:
                       x((A==uA1)&(B==uB0)&(C==uC0)) = -1;
                       x((A==uA1)&(B==uB0)&(C==uC1)) = +1;
                       x((A==uA1)&(B==uB1)&(C==uC0)) = +1;
                       x((A==uA1)&(B==uB1)&(C==uC1)) = -1;
                       X = [X x]; %#ok<*AGROW>
                   end
               end
           end
       end
       
       function X = get_design_main(self)
           X   = zeros(self.J, self.nPairs);
           for k = 1:self.nPairs
               [u0,u1] = deal(self.pairs(k,1), self.pairs(k,2));
               X(self.A==u0,k) = 1;
               X(self.A==u1,k) = -1;
           end
       end
       
       
   end
    
end