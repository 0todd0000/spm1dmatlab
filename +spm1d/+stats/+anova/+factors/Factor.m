%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky




classdef Factor
    properties
        A
        J
        u
        n
        isnested    = false;
        balanced    = true;
        nested      = [];
    end
    methods
        
        function self = Factor(A, varargin)
            self.A = A;
            self.J = numel(A);
            self.u = unique(A);
            self.n = numel(self.u);
            %check unbalanced:
            JJ = zeros(self.n,1);
            for k = 1:self.n
               JJ(k) = sum(A==self.u(k));
            end
            self.balanced = all(JJ==JJ(1));
        end
        
        
        function [balanced] = check_balanced(self, other)
            [A,B] = deal(self.A, other.A);
            balanced = true;
            N = -1;
            for k=1:self.n
                for kk=1:other.n
                    [uA,uB] = deal(self.u(k), other.u(kk));
                    n = sum(  (A==uA) & (B==uB)  );
                    if N==-1
                        N = n;
                    else
                        balanced = n==N;
                        break
                    end
                end
            end
        end
            
 
        function [balanced] = check_balanced_nested(self, other)
            [A,B] = deal(self.A, other.A);
            [uA,UB] = deal(self.u, other.u);
            [nA,NB] = deal(self.n, other.n);
            balanced = true;
            N = -1;
            for k=1:nA
                [uB,nB] = deal(UB{k}, NB(k));
                for kk=1:nB
                    [uuA,uuB] = deal(uA(k), uB(kk));
                    n = sum(  (A==uuA) & (B==uuB)  );
                    if N==-1
                        N = n;
                    else
                        balanced = n==N;
                    end
                end
            end
        end
        
        
        function X = get_design_interaction(self, other)
           [A,B]   = deal(self.A, other.A);  %#ok<*PROP>
           [nA,nB] = deal(self.n, other.n);
           X   = zeros(self.J, (nA-1)*(nB-1) );
           ind = 0;
           for iB = 1:nB-1
               for iA = 1:nA-1
                   ind = ind+1;
                   [uA,uB] = deal(self.u(iA+1), other.u(iB+1));
                   X( (A==uA)&(B==uB), ind ) = 1;
               end
           end

       end
       
        function [X] = get_design_interaction_3way(self, other, another)
           [A,B,C]    = deal(self.A, other.A, another.A);  %#ok<*PROP>
           [nA,nB,nC] = deal(self.n, other.n, another.n);
           X          = [];
           for k = 1:nA-1
               for kk = 1:nB-1
                   for kkk = 1:nC-1
                       [uA,uB,uC]  = deal( self.u(k+1), other.u(kk+1), another.u(kkk+1) );
                       x = zeros(self.J, 1);
                       x((A==uA)&(B==uB)&(C==uC)) = +1;
                       X = [X x]; %#ok<*AGROW>
                   end
               end
           end
        end
        
        
        function [X] = get_design_interaction_4way(self, other, another, yetanother)
           [S,A,B,C]     = deal(self.A, other.A, another.A, yetanother.A);  %#ok<*PROP>
           [uS,uA,uB,uC] = deal(self.u, other.u, another.u, yetanother.u);
           [nS,nA,nB,nC] = deal(self.n, other.n, another.n, yetanother.n);
           X             = [];
           for k = 1:nA-1
               for kk = 1:nB-1
                   for kkk = 1:nC-1
                       for kkkk = 1:nS-1
                            [uuA,uuB,uuC,uuS]  = deal( uA(k+1), uB(kk+1), uC(kkk+1), uS(kkkk+1) );
                            x = zeros(self.J, 1);
                            x((A==uuA)&(B==uuB)&(C==uuC)&(S==uuS)) = +1;
                            X = [X x]; %#ok<*AGROW>
                       end
                   end
               end
           end
       end

        
        function X = get_design_main(self)
           X   = zeros(self.J, self.n-1);
           for k = 1:self.n-1
               X(self.A==self.u(k+1),k) = 1;
           end
       end
       
       
   end
    
end