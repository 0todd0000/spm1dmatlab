%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CIbase < matlab.mixin.CustomDisplay
    properties
        %summary attributes
        name
        dim = 0;
        kind
        nMeans
        %means, datum, and criteria
        criterion_type
        criterion_value
        criterion = {};
        datum_ci
        datum_type
        datum_value
        datum = {};
        %probability
        alpha
        df
        zstar
        %confidence interval
        hstar
        h0reject
        %booleans
        ismultimean
        isparametric
        isscalarmu
        istest
    end
    
    methods
        
        function [self] = CIbase(spmi)
            self.alpha     = spmi.alpha;
            self.df        = spmi.df;
            self.zstar     = spmi.zstar;
            self.h0reject  = spmi.h0reject;
        end
        
        
        function [s] = get_h0rejection_decision_reason(self)
            if self.h0reject
                reason = 'outside';
            else
                reason = 'inside';
            end
            s = sprintf('%s %s %s', self.criterion_type, reason, self.datum_ci);
        end
        
        function [x] = get_percent(self)
            x    = 100 * (1 - self.alpha);
        end
         function [s] = get_percent_asstr(self)
            s = sprintf('%.1f%s', self.get_percent(), '%');
        end       
    end
    
    methods (Access=private)
        function [s] = bool2str(~, b)
            if b
                s = 'True';
            else
                s = 'False';
            end
        end
    end
            
 
    methods (Access = protected)
        function [self] = assemble_datum_criterion_pairs(self)
            self.datum     = {self.datum_type, self.datum_value};
            self.criterion = {self.criterion_type, self.criterion_value};
            if (self.dim==1) && isequal(self.criterion_type,'tailB')
                self.criterion{2} = '(CI divergence)';
            end
        end
                
                
        function header = getHeader(self)
            header = sprintf('\n%s (%s)',self.name, self.get_percent_asstr());
        end
        
        function propgrp = getPropertyGroups(self)
            plist = struct;
            plist.kind      = self.kind;
            plist.datum     = self.datum;
            plist.criterion = self.criterion;
            plist.alpha     = self.alpha;
            plist.df        = self.df;
            plist.zstar     = self.zstar;
            plist.hstar     = self.hstar;
            if isequal(self.datum_type, 'mean')
                plist.ci    = self.ci;
            elseif isequal(self.criterion_type, 'meanB')
                plist.ciA   = self.ciA;
            elseif isequal(self.criterion_type, 'tailB')
                plist.ciA   = self.ciA;
                plist.ciB   = self.ciB;
            end
            plist.h0reject  = sprintf('%s (%s)', self.bool2str(self.h0reject), self.get_h0rejection_decision_reason());
            propgrp = matlab.mixin.util.PropertyGroup(plist);
        end
   end
              
   
    
end