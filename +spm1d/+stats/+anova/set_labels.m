function [spmlist] = set_labels(spmlist, design)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



%set design label:
s                           = strsplit(class( design ), '.');
spmlist.design              = s{end};


%set effect labels:
labels                      = design.effect_labels;
spmlist.effect_labels       = labels;


%set short effect labels:
n                           = numel(labels);
labels_short                = cell(1, n);
for i = 1:n
    s                       = strsplit( labels{i} );
    labels_short{i}         = s{end};
end
spmlist.effect_labels_short = labels_short;


%set effect labels (SPM objects):
for i = 1:n
    spm                     = spmlist(i);
    spm.effect              = labels{i};
    spmlist.SPMs{i}         = spm;
end
