%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPMiList.m 1 2016-01-04 16:07 todd $



classdef SPMiList
    properties
        SPMs
        n
    end
    
    methods
        
        function [self] = SPMiList(SPMs)
            self.SPMs = SPMs;
            self.n    = numel(SPMs);
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
            [F,df,p] = deal(zeros(1,self.n), cell(1,self.n), zeros(1,self.n));
            for i = 1:self.n
                spm   = self.SPMs{i};
                F(i)  = spm.z;
                df{i} = spm.df;
                p(i)  = spm.p;
            end
            results.F = F;
            results.df = df;
            results.p = p;
            fprintf('SPMDiList summary:\n')
            disp(results)
        end
        
        
    end
    
    
end