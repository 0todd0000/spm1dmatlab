
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPMList.m 1 2016-01-04 16:07 todd $


classdef SPMList
    properties
        SPMs
        n
    end
    
    methods
        
        function [self] = SPMList(SPMs)
            self.SPMs = SPMs;
            self.n    = numel(SPMs);
       end
       
       function SPMis = inference(self, alpha, varargin)
           SPMis = cell(1, self.n);
           for i = 1:self.n
               spm = self.SPMs{i};
               spmi = spm.inference(alpha, varargin{:});
               SPMis{i} = spmi;
           end
           SPMis = spm1d.stats.spm.SPMiList(SPMis);
       end
       

%         function spm = subsref(self, i)
%             if isequal(i(1).type, '.') && isequal(i(1).subs, 'inference')
%                 spm = self.inference(
%             end
%             if isequal(i.type, '{}')
%                 error('Use "( )" to get individual objects from an SPMList')
%             end
%             if numel(i.subs)>1 || numel(i.subs{1})>1
%                 error('Only single indexes supported.  Use "(x)" where "x" is an integer')
%             end
%             i  = i.subs{1};
%             spm = self.SPMs{i};
%         end
       
%         function disp(self)
%             for i = 1:self.n
%                 disp(self.SPMs{i})
%             end
%         end
        
        function disp_summ(self)
            for i = 1:self.n
                if numel(self.SPMs{i}.z) > 1
                    error('The disp_summ function should be used only for 0D analysis')
                end
            end
            [F,df] = deal(zeros(1,self.n), cell(1,self.n));
            for i = 1:self.n
                spm   = self.SPMs{i};
                F(i)  = spm.z;
                df{i} = spm.df;
            end
            results.F = F;
            results.df = df;
            fprintf('SPMDList summary:\n')
            disp(results)
        end
        
        
    end
    
    
end