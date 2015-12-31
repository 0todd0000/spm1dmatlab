%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef SPM0D < matlab.mixin.CustomDisplay
    properties
        STAT
        df
        z
        r
        isregress = false;
    end
    
    methods
        
        function [self] = SPM0D(STAT, z, df)
            self.STAT     = STAT;
            self.z        = z;
            self.df       = df;
       end
       
       function spmi = inference(self, alpha, varargin)
            %parse inputs
            default2tailed = isequal(self.STAT,'T');
            parser = inputParser;
            addOptional(parser, 'two_tailed', default2tailed, @islogical);
            parser.parse(varargin{:});
            two_tailed    = parser.Results.two_tailed;
            %two-tailed check
            if two_tailed && ~isequal(self.STAT, 'T')
                error('Two-tailed inference can only be used for t tests and regression.')
            end
            %correct for two-tailed inference
            if two_tailed
                pstar = alpha/2;
            else
                pstar = alpha;
            end
            %compute critical threshold
            zstar  = self.get_critical_threshold(pstar);
            p      = self.get_p_value(two_tailed);
            if isequal(self.STAT, 'F')
                spmi = spm1d.stats.spm.SPM0DFi(self, alpha, zstar, p, two_tailed);
            else
                spmi = spm1d.stats.spm.SPM0Di(self, alpha, zstar, p, two_tailed);
            end

       end
       
       
    end
    
    methods (Access=private)
        
        function [zstar] = get_critical_threshold(self, alpha)
            switch self.STAT
                case 'T'
                    zstar = spm1d.rft1d.t.isf0d(alpha, self.df(2));
                case 'X2'
                    zstar = spm1d.rft1d.chi2.isf0d(alpha, self.df(2));
                case 'F'
                    zstar = spm1d.rft1d.f.isf0d(alpha, self.df);
                case 'T2'
                    zstar = spm1d.rft1d.T2.isf0d(alpha, self.df);
            end
        end
        
        function [p] = get_p_value(self, two_tailed)
            switch self.STAT
                case 'T'
                    if two_tailed
                        p = spm1d.rft1d.t.sf0d( abs(self.z), self.df(2) );
                        p = min(1, 2*p);
                    else
                        p = spm1d.rft1d.t.sf0d( self.z, self.df(2) );
                    end
                case 'X2'
                    p = spm1d.rft1d.chi2.sf0d( self.z, self.df(2) );
                case 'F'
                    p = spm1d.rft1d.f.sf0d( self.z, self.df );
                case 'T2'
                    p = spm1d.rft1d.T2.sf0d( self.z, self.df );
            end
        end
    end
            
 
    methods (Access = protected)
        function header = getHeader(self)
            s = self.STAT;
            if s == 'T'
                s = 't';
            end
            header = sprintf('\nSPM{%s} (0D)',s);
        end
        
        function propgrp = getPropertyGroups(self)
            propList = struct(...
                'z', self.z,...
                'df', self.df);
            if self.isregress
                propList.r = self.r;
            end
         propgrp = matlab.mixin.util.PropertyGroup(propList);
        end
   end
              
   
    
end