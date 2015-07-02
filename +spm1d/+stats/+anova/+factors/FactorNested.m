


classdef FactorNested
    properties
        A
        NEST
        J
        u
        n
        pairs
        nPairs
        isnested    = true;
        isrm        = false;
        isbalanced  = true;
        nested      = [];
    end
    
    methods
        function [self] = FactorNested(A, NEST)
            self.A      = A;
            self.NEST   = NEST;
            self.J      = numel(A);
            self.u      = cell(1, self.NEST.n);
            self.n      = zeros(1, self.NEST.n);
            self.pairs  = cell(1, self.NEST.n);
            self.nPairs = zeros(1, self.NEST.n);
            [N,Nu]      = deal(self.NEST.A, self.NEST.u);
            for i = 1:self.NEST.n
                self.u{i}      = unique( A(N==Nu(i)) );
                self.n(i)      = numel(self.u{i});
                self.pairs{i}  = [self.u{i}(1:end-1) self.u{i}(2:end)];
                self.nPairs(i) = size(self.pairs{i}, 1);
            end
            %check unbalanced:
        end
       
        function X = get_design_main(self)
           [A,B] = deal(self.NEST.A, self.A); %#ok<*PROP,*ASGLU>
           n   = numel(self.n);
           X   = [];
           for k = 1:n
               u     = self.NEST.u(k); %#ok<*NASGU>
               pairs = self.pairs{k};
               for kk = 1:size(pairs,1)
                   [u0,u1] = deal(pairs(kk,1), pairs(kk,2));
                   x = zeros(self.J,1);
                   x((A==u)&(B==u0)) = 1;
                   x((A==u)&(B==u1)) = -1;
                   X = [X x]; %#ok<AGROW>
               end
           end
       end

       
   end
    
end