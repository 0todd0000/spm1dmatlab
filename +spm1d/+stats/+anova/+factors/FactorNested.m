%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky




classdef FactorNested
    properties
        A
        NEST
        J
        u
        n
        isnested    = true;
        balanced    = true;
        nested      = [];
    end
    
    methods
        function [self] = FactorNested(A, NEST)
            self.A      = A;
            self.NEST   = NEST;
            self.J      = numel(A);
            self.u      = cell(1, self.NEST.n);
            self.n      = zeros(1, self.NEST.n);
            [N,Nu]      = deal(self.NEST.A, self.NEST.u);
            for i = 1:self.NEST.n
                self.u{i}      = unique( A(N==Nu(i)) );
                self.n(i)      = numel(self.u{i});
            end
        end
        
        
        function [balanced] = check_balanced_rm(self, other)
            [S,A] = deal(self.A, other.A);
            [uA,nA] = deal(other.u, other.n);
            balanced = true;
            N = -1;
            for k=1:nA
                uuA = uA(k);
                uS = unique( S(A==uuA) );
                for kk = 1:numel(uS)
                    uuS = uS(kk);
                    n = sum(  (A==uuA) & (S==uuS)  );
                    if N==-1
                        N = n;
                    else
                        balanced = n==N;
                    end
                end
            end
        end
        
        
        function X = get_design_main(self)
           [A,B]   = deal(self.NEST.A, self.A); %#ok<*PROP,*ASGLU>
           X   = [];
           for k = 1:numel(self.n)
               [uA,UB] = deal(self.NEST.u(k), self.u{k});
               for kk = 1:numel(UB)-1
                   uB  = UB(kk+1);
                   x = zeros(self.J,1);
                   x((A==uA)&(B==uB)) = 1;
                   X = [X x]; %#ok<AGROW>
               end
           end
        end

        
        
        function X = get_design_interaction(self, other)
           [A,B,S]   = deal(self.NEST.A, other.A, self.A); %#ok<*PROP,*ASGLU>
           [uA,uB,US] = deal(self.NEST.u, other.u, self.u);
           [nA,nB,NS] = deal(self.NEST.n, other.n, self.n);
           X   = [];
           for k = 1:nA
               [uS,nS] = deal(US{k}, NS(k));
               uuA = uA(k);
               for kk = 1:nB-1
                   uuB = uB(kk+1);
                    for kkk = 1:nS-1
                        uuS = uS(kkk+1);
                        x = zeros(self.J,1);
                        x((A==uuA)&(B==uuB)&(S==uuS)) = 1;
                        X = [X x]; %#ok<AGROW>
                    end
               end
           end
        end
       
        
        function X = get_design_interaction_3way(self, other, another)
           [A,B,C,S]   = deal(self.NEST.A, other.A, another.A, self.A); %#ok<*PROP,*ASGLU>
           [uA,uB,uC,US] = deal(self.NEST.u, other.u, another.u, self.u);
           [nA,nB,nC,NS] = deal(self.NEST.n, other.n, another.n, self.n);
           X   = [];
           for k = 1:nA
               [uS,nS] = deal(US{k}, NS(k));
               uuA = uA(k);
               for kk = 1:nB-1
                   uuB = uB(kk+1);
                   for kkk = 1:nC-1
                        uuC = uC(kkk+1);
                        for kkkk = 1:nS-1
                            uuS = uS(kkk+1);
                            x = zeros(self.J,1);
                            x((A==uuA)&(B==uuB)&(C==uuC)&(S==uuS)) = 1;
                            X = [X x]; %#ok<AGROW>
                        end
                    end
               end
           end
       end


       
        
   end
    
end