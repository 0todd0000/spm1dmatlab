
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef ASPMFList  < matlab.mixin.CustomDisplay
    properties
        SPMs
        name
        dim           = 0;
        design        = '';
        nEffects      = 1;
        effect_labels = {};
        isparametric  = true;
        residuals
        Q
    end
    
    properties (Hidden)
        effect_labels_short = {};
    end
    
    
    methods
        
        function [self] = ASPMFList(SPMs)
            self.SPMs      = SPMs;
            self.nEffects  = numel(SPMs);
            self.residuals = SPMs{1}.residuals;
            self.dim       = SPMs{1}.dim;
        end
       



        function spm = subsref(self, s)
            switch s(1).type
                case '.'
                    spm = builtin('subsref', self, s);

                case '()'
                    i  = s.subs{1};

                    if ischar(i)
                        [~,ind] = ismember(i, self.effect_labels_short);
                        if ind==0
                            error('Unknown effect label "%s". This SPM list contains only the following effect labels: %s', i, self.get_effect_labels_as_str())
                        end
                        spm = self.SPMs{ind};
            
            
                    elseif isscalar(i)
                        if numel(i) > 1
                            error('Only single indices accepted.')
                        end
                        if i < 1
                            error('A numerical index to an SPM list must be an integer greater than zero.')
                        end
                        if i ~= floor(i)
                            error('A numerical index to an SPM list must be an integer.')
                        end
                        if i > self.nEffects
                            error('Index exceeds dimensions.  There are only %d SPMs in this list.', self.nEffects)
                        end
                        spm = self.SPMs{i};
            
                    else
                        error('The index to an SPM list must be an integer or one of the following effect labels: %s', self.get_effect_labels_as_str())
                    end
                
                case '{}'
                    error('Only round-bracket indexing is supported, for example: "  spm_list(1) " )')
                
                
            end
        end



        function disp_summ(self)
            self.disp_summ_header();
            self.disp_summ_table();
            fprintf('\n')
        end
        
        
        function [dfs] = get_df_values(self)
            dfs = cell(1, self.nEffects);
            for k = 1:self.nEffects
                dfs{k} = self.SPMs{k}.df;
            end
        end
        
        function [z] = get_test_stats(self)
            if self.dim == 0
                z = zeros(1, self.nEffects);
                for i = 1:self.nEffects
                    z(i) = self.SPMs{i}.z;
                end
            else
                z = zeros(self.nEffects, self.Q);
                for i = 1:self.nEffects
                    z(i,:) = self.SPMs{i}.z;
                end
            end
        end
        

    end


    methods (Access = protected)
        
        function [s] = n2str(~, n)
            if n>1e6
                s = sprintf('%e', n);
            else
                s = sprintf('%d', n);
            end
        end
        
        
        function disp_summ_header(self)
            fprintf('%s (%dD)\n', self.name, self.dim)
            fprintf('   design    : %s\n', self.design)
            fprintf('   nEffects  : %d\n', self.nEffects)
            if ~self.isparametric
                nU    = self.n2str( self.nPermUnique );
                fprintf('   nPermUnique  : %s\n', nU)
                if self.isinference
                    nA    = self.n2str( self.nPermActual );
                    fprintf('   nPermActual  : %s\n', nA)
                end
            end
        end
        
        function disp_summ_table(self)
            fprintf('Effects:\n')
            for i = 1:self.nEffects
                spm  = self.SPMs{i};
                if self.dim == 0
                    if self.isparametric
                        fprintf('   %3s     F = %6.3f    df = (%d, %d)\n', self.effect_labels_short{i}, spm.z, spm.df(1), spm.df(2))
                    else
                        fprintf('   %3s     F = %6.3f\n', self.effect_labels_short{i}, spm.z)
                    end
                else
                    if self.isparametric
                        fprintf('   %3s     F = (1x%d) array    df = (%d, %d)\n', self.effect_labels_short{i}, numel(spm.z), spm.df(1), spm.df(2))
                    else
                        fprintf('   %3s     F = (1x%d) array\n', self.effect_labels_short{i}, numel(spm.z))
                    end
                end
            end
        end

        function [s] = get_effect_labels_as_str(self)
            s = strjoin( self.effect_labels_short, ', ');
        end

        function propgrp = getPropertyGroups(self)
            props               = struct;
            props.design        = self.design;
            props.nEffects      = self.nEffects;
            props.effect_labels = self.effect_labels;
            propgrp             = matlab.mixin.util.PropertyGroup(props);
        end
    end


end